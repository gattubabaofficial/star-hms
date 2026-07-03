Attribute VB_Name = "VgnDataStru"

Option Explicit

Public Sub CreateVgnMastDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbVgnDatabase As New ADODB.Connection, dbVgnCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbVgnDatabaseFullPath) = "" Then
        dbVgnCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbVgnDatabaseFullPath
        Set dbVgnCatalog = Nothing
    Else
        ErrorBox "Database " & dbVgnDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenVgnDataSource dbVgnDatabase, mExclusiveMode:=True
If dbVgnDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbVgnCatalog.ActiveConnection = dbVgnDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 31
    End If
End If

With clsDB
.ClearTableStru
.TableName = "PatCatgMst"
Rem field definitions
.AddColumn: .ColumnName() = "PcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PcgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PcgInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PcgDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PcgDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PcgDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PcgShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PcgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "PcgCode"
Rem index definition
.AddIndex: .IndexName() = "PcgName": .IndexUnique() = True: .IndexColumn1() = "PcgName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PatCatgMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PcgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PcgInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PcgDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PcgDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PcgDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PcgShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PcgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "PcgCode"
Rem index definition
.AddIndex: .IndexName() = "PcgCode": .IndexUnique() = True: .IndexColumn1() = "PcgCode"
.AddIndex: .IndexName() = "PcgName": .IndexUnique() = True: .IndexColumn1() = "PcgName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DoctCatgMst"
Rem field definitions
.AddColumn: .ColumnName() = "DcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "DcgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DcgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "DcgCode"
Rem index definition
.AddIndex: .IndexName() = "DcgName": .IndexUnique() = True: .IndexColumn1() = "DcgName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DoctCatgMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "DcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DcgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DcgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "DcgCode"
Rem index definition
.AddIndex: .IndexName() = "DcgName": .IndexUnique() = True: .IndexColumn1() = "DcgName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "RefCatgMst"
Rem field definitions
.AddColumn: .ColumnName() = "RfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "RfgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "RfgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "RfgCode"
Rem index definition
.AddIndex: .IndexName() = "RfgName": .IndexUnique() = True: .IndexColumn1() = "RfgName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "RefCatgMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "RfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "RfgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "RfgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "RfgCode"
Rem index definition
.AddIndex: .IndexName() = "RfgCode": .IndexUnique() = True: .IndexColumn1() = "RfgCode"
.AddIndex: .IndexName() = "RfgName": .IndexUnique() = True: .IndexColumn1() = "RfgName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DoctMast"
Rem field definitions
.AddColumn: .ColumnName() = "DctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "DctTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DctSpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctDcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "DctCode"
Rem index definition
.AddIndex: .IndexName() = "DctName": .IndexUnique() = True: .IndexColumn1() = "DctName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DoctMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "DctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DctTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DctSpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctDcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "DctRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "DctCode"
Rem index definition
.AddIndex: .IndexName() = "DctCode": .IndexUnique() = True: .IndexColumn1() = "DctCode"
.AddIndex: .IndexName() = "DctName": .IndexUnique() = True: .IndexColumn1() = "DctName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DoctRoleMst"
Rem field definitions
.AddColumn: .ColumnName() = "DrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "DrlName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DrlRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "DrlCode"
Rem index definition
.AddIndex: .IndexName() = "DrlName": .IndexUnique() = True: .IndexColumn1() = "DrlName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DoctRoleMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "DrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DrlName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DrlRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "DrlCode"
Rem index definition
.AddIndex: .IndexName() = "DrlCode": .IndexUnique() = True: .IndexColumn1() = "DrlCode"
.AddIndex: .IndexName() = "DrlName": .IndexUnique() = True: .IndexColumn1() = "DrlName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "RefByMast"
Rem field definitions
.AddColumn: .ColumnName() = "RByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "RByName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "RBySpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByRfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "RByCode"
Rem index definition
.AddIndex: .IndexName() = "RByName": .IndexUnique() = True: .IndexColumn1() = "RByName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "RefByMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "RByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "RByName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "RBySpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByRfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RByRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "RByCode"
Rem index definition
.AddIndex: .IndexName() = "RByCode": .IndexUnique() = True: .IndexColumn1() = "RByCode"
.AddIndex: .IndexName() = "RByName": .IndexUnique() = True: .IndexColumn1() = "RByName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "RefToMast"
Rem field definitions
.AddColumn: .ColumnName() = "RToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "RToName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "RToSpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToRfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "RToCode"
Rem index definition
.AddIndex: .IndexName() = "RToName": .IndexUnique() = True: .IndexColumn1() = "RToName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "RefToMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "RToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "RToName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "RToSpeci": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToRfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToShare": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "RToRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "RToCode"
Rem index definition
.AddIndex: .IndexName() = "RToCode": .IndexUnique() = True: .IndexColumn1() = "RToCode"
.AddIndex: .IndexName() = "RToName": .IndexUnique() = True: .IndexColumn1() = "RToName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ServGrpMst"
Rem field definitions
.AddColumn: .ColumnName() = "SgpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SgpName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SgpIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExpanded": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpPcgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpPcgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpPcgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpPcgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SgpCode"
Rem index definition
.AddIndex: .IndexName() = "SgpName": .IndexUnique() = True: .IndexColumn1() = "SgpName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ServGrpMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SgpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SgpName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SgpIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExpanded": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpPcgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpPcgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpPcgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpPcgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SgpCode"
Rem index definition
.AddIndex: .IndexName() = "SgpCode": .IndexUnique() = True: .IndexColumn1() = "SgpCode"
.AddIndex: .IndexName() = "SgpName": .IndexUnique() = True: .IndexColumn1() = "SgpName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ServMast"
Rem field definitions
.AddColumn: .ColumnName() = "SrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SrvName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrvSgpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvOpdGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvOpdEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvIpdGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvIpdEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvLabGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvLabEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvMultiDctIncl": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvAutoInsIpdBill": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvAutoCalcIpdBill": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvAutoInsOnceIpdBill": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvUnitEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRateEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvAmtEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvPcgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvPcgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvPcgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvPcgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SrvCode"
Rem index definition
.AddIndex: .IndexName() = "SrvName": .IndexUnique() = True: .IndexColumn1() = "SrvName"

.CreateTable dbVgnCatalog
End With
Rem temp updations
dbVgnCatalog.ActiveConnection.Execute "Update ServMast set SrvRate = SrvOpdGenChg where isnull(SrvRate)"

With clsDB
.ClearTableStru
.TableName = "ServMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrvName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrvSgpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvOpdGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvOpdEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvIpdGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvIpdEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvLabGenChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvLabEmgChg": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvMultiDctIncl": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvAutoInsIpdBill": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvAutoCalcIpdBill": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvAutoInsOnceIpdBill": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvUnitEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRateEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvAmtEditable": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvPcgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvPcgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvPcgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvPcgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SrvCode"
Rem index definition
.AddIndex: .IndexName() = "SrvCode": .IndexUnique() = True: .IndexColumn1() = "SrvCode"
.AddIndex: .IndexName() = "SrvName": .IndexUnique() = True: .IndexColumn1() = "SrvName"

.CreateTable dbVgnCatalog
End With
dbVgnCatalog.ActiveConnection.Execute "Update ServMast_Log set SrvRate = SrvOpdGenChg where isnull(SrvRate)"

With clsDB
.ClearTableStru
.TableName = "ServRateMst"
Rem field definitions
.AddColumn: .ColumnName() = "SrmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SrmSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmWefDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmPcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmStartTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmEndTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmInfByPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmDefByPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmSharePer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmShareAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SrmICode"
Rem index definition
.AddIndex: .IndexName() = "SrmCodeICode": .IndexColumn1() = "SrmCode": .IndexColumn2() = "SrmICode"
.AddIndex: .IndexName() = "SrmCodeSNo": .IndexColumn1() = "SrmCode": .IndexColumn2() = "SrmSno"
.AddIndex: .IndexName() = "SrmWefDate": .IndexColumn1() = "SrmWefDate"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ServRateMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SrmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmWefDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmPcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmStartTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmEndTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmInfByPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmDefByPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmSharePer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmShareAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SrmICode"
Rem index definition
.AddIndex: .IndexName() = "SrmICode": .IndexUnique() = True: .IndexColumn1() = "SrmICode"
.AddIndex: .IndexName() = "SrmCodeICode": .IndexColumn1() = "SrmCode": .IndexColumn2() = "SrmICode"
.AddIndex: .IndexName() = "SrmCodeSNo": .IndexColumn1() = "SrmCode": .IndexColumn2() = "SrmSno"
.AddIndex: .IndexName() = "SrmWefDate": .IndexColumn1() = "SrmWefDate"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PatMast"
Rem field definitions
.AddColumn: .ColumnName() = "PttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PttName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PttRegNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttRegDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttPcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttSex": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttAgeAsOnDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttDob": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttRefRela": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttRefName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "PttCode"
Rem index definition
.AddIndex: .IndexName() = "PttName": .IndexColumn1() = "PttName"
.AddIndex: .IndexName() = "PttRegNo": .IndexColumn1() = "PttRegNo"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PatMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PttName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PttRegNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttRegDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttPcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttSex": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttAgeAsOnDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttDob": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttRefRela": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttRefName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttInfAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttDefAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PttRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "PttCode"
Rem index definition
.AddIndex: .IndexName() = "PttCode": .IndexUnique() = True: .IndexColumn1() = "PttCode"
.AddIndex: .IndexName() = "PttName": .IndexColumn1() = "PttName"
.AddIndex: .IndexName() = "PttRegNo": .IndexColumn1() = "PttRegNo"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DiagMast"
Rem field definitions
.AddColumn: .ColumnName() = "DigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "DigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "DigCode"
Rem index definition
.AddIndex: .IndexName() = "DigName": .IndexUnique() = True: .IndexColumn1() = "DigName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DiagMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "DigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "DigCode"
Rem index definition
.AddIndex: .IndexName() = "DigCode": .IndexUnique() = True: .IndexColumn1() = "DigCode"
.AddIndex: .IndexName() = "DigName": .IndexUnique() = True: .IndexColumn1() = "DigName"

.CreateTable dbVgnCatalog
End With


Rem --------------------------------- Store Master -----------------------------------------

With clsDB
.ClearTableStru
.TableName = "MedItmMast"
Rem field definitions
.AddColumn: .ColumnName() = "MdiCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "MdiName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MdiMigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiPurchRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiMRPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiSaleRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "MdiCode"
Rem index definition
.AddIndex: .IndexName() = "MdiName": .IndexUnique() = True: .IndexColumn1() = "MdiName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedItmMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "MdiCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MdiMigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiPurchRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiMRPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiSaleRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MdiRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "MdiCode"
Rem index definition
.AddIndex: .IndexName() = "MdiCode": .IndexUnique() = True: .IndexColumn1() = "MdiCode"
.AddIndex: .IndexName() = "MdiName": .IndexUnique() = True: .IndexColumn1() = "MdiName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedItmGrpMst"
Rem field definitions
.AddColumn: .ColumnName() = "MigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "MigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MigDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "MigCode"
Rem index definition
.AddIndex: .IndexName() = "MigName": .IndexUnique() = True: .IndexColumn1() = "MigName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedItmGrpMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "MigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MigDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "MigCode"
Rem index definition
.AddIndex: .IndexName() = "MigCode": .IndexUnique() = True: .IndexColumn1() = "MigCode"
.AddIndex: .IndexName() = "MigName": .IndexUnique() = True: .IndexColumn1() = "MigName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPrtMast"
Rem field definitions
.AddColumn: .ColumnName() = "MptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "MptTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MptMpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MptAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "MptCode"
Rem index definition
.AddIndex: .IndexName() = "MptName": .IndexUnique() = True: .IndexColumn1() = "MptName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPrtMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "MptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MptTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MptMpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MptAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MptRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "MptCode"
Rem index definition
.AddIndex: .IndexName() = "MptCode": .IndexUnique() = True: .IndexColumn1() = "MptCode"
.AddIndex: .IndexName() = "MptName": .IndexUnique() = True: .IndexColumn1() = "MptName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPrtGrpMst"
Rem field definitions
.AddColumn: .ColumnName() = "MpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "MpgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpgDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "MpgCode"
Rem index definition
.AddIndex: .IndexName() = "MpgName": .IndexUnique() = True: .IndexColumn1() = "MpgName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPrtGrpMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "MpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "MpgDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "MpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "MpgCode"
Rem index definition
.AddIndex: .IndexName() = "MpgCode": .IndexUnique() = True: .IndexColumn1() = "MpgCode"
.AddIndex: .IndexName() = "MpgName": .IndexUnique() = True: .IndexColumn1() = "MpgName"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MonthRepFmt1st"
Rem field definitions
.AddColumn: .ColumnName() = "Mrf1Code": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "Mrf1Date": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "Mrf1Name": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "Mrf1FilePath": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "Mrf1RecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "Mrf1Code"
Rem index definition
.AddIndex: .IndexName() = "Mrf1Date": .IndexUnique() = True: .IndexColumn1() = "Mrf1Date"
.AddIndex: .IndexName() = "Mrf1Name": .IndexUnique() = True: .IndexColumn1() = "Mrf1Name"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MonthRepFmt1st_Log"
Rem field definitions
.AddColumn: .ColumnName() = "Mrf1Code": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "Mrf1Date": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "Mrf1Name": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "Mrf1FilePath": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "Mrf1RecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "Mrf1Code"
Rem index definition
.AddIndex: .IndexName() = "Mrf1Code": .IndexUnique() = True: .IndexColumn1() = "Mrf1Code"
.AddIndex: .IndexName() = "Mrf1Date": .IndexUnique() = True: .IndexColumn1() = "Mrf1Date"
.AddIndex: .IndexName() = "Mrf1Name": .IndexUnique() = True: .IndexColumn1() = "Mrf1Name"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MonthRepFmt2nd"
Rem field definitions
.AddColumn: .ColumnName() = "Mrf2Code": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "Mrf2Date": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "Mrf2Name": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "Mrf2FilePath": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "Mrf2RecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "Mrf2Code"
Rem index definition
.AddIndex: .IndexName() = "Mrf2Date": .IndexUnique() = True: .IndexColumn1() = "Mrf2Date"
.AddIndex: .IndexName() = "Mrf2Name": .IndexUnique() = True: .IndexColumn1() = "Mrf2Name"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MonthRepFmt2nd_Log"
Rem field definitions
.AddColumn: .ColumnName() = "Mrf2Code": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "Mrf2Date": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "Mrf2Name": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "Mrf2FilePath": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "Mrf2RecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "Mrf2Code"
Rem index definition
.AddIndex: .IndexName() = "Mrf2Code": .IndexUnique() = True: .IndexColumn1() = "Mrf2Code"
.AddIndex: .IndexName() = "Mrf2Date": .IndexUnique() = True: .IndexColumn1() = "Mrf2Date"
.AddIndex: .IndexName() = "Mrf2Name": .IndexUnique() = True: .IndexColumn1() = "Mrf2Name"

.CreateTable dbVgnCatalog
End With







Rem InfoBox dbVgnCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbVgnDatabase

EndSub:
Set dbVgnCatalog = Nothing
Set dbVgnDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateVgnTranDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbVgnDatabase As New ADODB.Connection, dbVgnCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbVgnDatabaseFullPath) = "" Then
        dbVgnCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbVgnDatabaseFullPath
        Set dbVgnCatalog = Nothing
    Else
        ErrorBox "Database " & dbVgnDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenVgnDataSource dbVgnDatabase, mExclusiveMode:=True
If dbVgnDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbVgnCatalog.ActiveConnection = dbVgnDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 31
    End If
End If

With clsDB
.ClearTableStru
.TableName = "OutdReg"
Rem field definitions
.AddColumn: .ColumnName() = "OpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OpgVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgOldOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgCDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgPDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgFDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
Rem .AddColumn: .ColumnName() = "OpgPttWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OpgCode"
Rem index definition
.AddIndex: .IndexName() = "OpgVchNo": .IndexColumn1() = "OpgVchNo"
.AddIndex: .IndexName() = "OpgDate": .IndexColumn1() = "OpgDate"
.AddIndex: .IndexName() = "OpgPttCode": .IndexColumn1() = "OpgPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdReg_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgOldOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgCDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgPDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgFDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
Rem .AddColumn: .ColumnName() = "OpgPttWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "OpgCode"
Rem index definition
.AddIndex: .IndexName() = "OpgCode": .IndexUnique() = True: .IndexColumn1() = "OpgCode"
.AddIndex: .IndexName() = "OpgVchNo": .IndexColumn1() = "OpgVchNo"
.AddIndex: .IndexName() = "OpgDate": .IndexColumn1() = "OpgDate"
.AddIndex: .IndexName() = "OpgPttCode": .IndexColumn1() = "OpgPttCode"

.CreateTable dbVgnCatalog
End With


Rem -------------------------------- Store Sale/Purchase tables ---------------------------------------------

With clsDB
.ClearTableStru
.TableName = "MedPurchHdr"
Rem field definitions
.AddColumn: .ColumnName() = "PuhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PuhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhMptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhAmtBefTax": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhOtherAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhROffAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "PuhCode"
Rem index definition
.AddIndex: .IndexName() = "PuhVtmCodeVchNo": .IndexColumn1() = "PuhVtmCode": .IndexColumn2() = "PuhVchNo"
.AddIndex: .IndexName() = "PuhDate": .IndexColumn1() = "PuhDate"
.AddIndex: .IndexName() = "PuhMptCode": .IndexColumn1() = "PuhMptCode"
.AddIndex: .IndexName() = "PuhPttCode": .IndexColumn1() = "PuhPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPurchHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PuhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhMptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhAmtBefTax": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhOtherAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhROffAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "PuhCode"
Rem index definition
.AddIndex: .IndexName() = "PuhCode": .IndexUnique() = True: .IndexColumn1() = "PuhCode"
.AddIndex: .IndexName() = "PuhVtmCodeVchNo": .IndexColumn1() = "PuhVtmCode": .IndexColumn2() = "PuhVchNo"
.AddIndex: .IndexName() = "PuhDate": .IndexColumn1() = "PuhDate"
.AddIndex: .IndexName() = "PuhMptCode": .IndexColumn1() = "PuhMptCode"
.AddIndex: .IndexName() = "PuhPttCode": .IndexColumn1() = "PuhPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPurchDtl"
Rem field definitions
.AddColumn: .ColumnName() = "PurCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PurSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurMptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurMdiCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurMdiRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurMRP": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurSRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurAmtBefTax": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "PurICode"
Rem index definition
.AddIndex: .IndexName() = "PurCodeICode": .IndexColumn1() = "PurCode": .IndexColumn2() = "PurICode"
.AddIndex: .IndexName() = "PurCodeSNo": .IndexColumn1() = "PurCode": .IndexColumn2() = "PurSno"
.AddIndex: .IndexName() = "PurDate": .IndexColumn1() = "PurDate"
.AddIndex: .IndexName() = "PurMptCode": .IndexColumn1() = "PurMptCode"
.AddIndex: .IndexName() = "PurPttCode": .IndexColumn1() = "PurPttCode"
.AddIndex: .IndexName() = "PurMdiCode": .IndexColumn1() = "PurMdiCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPurchDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PurCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurMptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurMdiCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurMdiRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurMRP": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurSRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurAmtBefTax": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "PurICode"
Rem index definition
.AddIndex: .IndexName() = "PurICode": .IndexUnique() = True: .IndexColumn1() = "PurICode"
.AddIndex: .IndexName() = "PurCodeICode": .IndexColumn1() = "PurCode": .IndexColumn2() = "PurICode"
.AddIndex: .IndexName() = "PurCodeSNo": .IndexColumn1() = "PurCode": .IndexColumn2() = "PurSno"
.AddIndex: .IndexName() = "PurDate": .IndexColumn1() = "PurDate"
.AddIndex: .IndexName() = "PurMptCode": .IndexColumn1() = "PurMptCode"
.AddIndex: .IndexName() = "PurPttCode": .IndexColumn1() = "PurPttCode"
.AddIndex: .IndexName() = "PurMdiCode": .IndexColumn1() = "PurMdiCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSaleHdr"
Rem field definitions
.AddColumn: .ColumnName() = "SahCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SahVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahMptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahAmtBefTax": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahOtherAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahROffAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SahCode"
Rem index definition
.AddIndex: .IndexName() = "SahVtmCodeVchNo": .IndexColumn1() = "SahVtmCode": .IndexColumn2() = "SahVchNo"
.AddIndex: .IndexName() = "SahDate": .IndexColumn1() = "SahDate"
.AddIndex: .IndexName() = "SahMptCode": .IndexColumn1() = "SahMptCode"
.AddIndex: .IndexName() = "SahPttCode": .IndexColumn1() = "SahPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSaleHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SahCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahMptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahAmtBefTax": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahOtherAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahROffAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SahCode"
Rem index definition
.AddIndex: .IndexName() = "SahCode": .IndexUnique() = True: .IndexColumn1() = "SahCode"
.AddIndex: .IndexName() = "SahVtmCodeVchNo": .IndexColumn1() = "SahVtmCode": .IndexColumn2() = "SahVchNo"
.AddIndex: .IndexName() = "SahDate": .IndexColumn1() = "SahDate"
.AddIndex: .IndexName() = "SahMptCode": .IndexColumn1() = "SahMptCode"
.AddIndex: .IndexName() = "SahPttCode": .IndexColumn1() = "SahPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSaleDtl"
Rem field definitions
.AddColumn: .ColumnName() = "SalCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SalSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalMptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalMdiCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalMdiRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalPurCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalPurICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalAmtBefTax": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SalICode"
Rem index definition
.AddIndex: .IndexName() = "SalCodeICode": .IndexColumn1() = "SalCode": .IndexColumn2() = "SalICode"
.AddIndex: .IndexName() = "SalCodeSNo": .IndexColumn1() = "SalCode": .IndexColumn2() = "SalSno"
.AddIndex: .IndexName() = "SalDate": .IndexColumn1() = "SalDate"
.AddIndex: .IndexName() = "SalPurCodeICode": .IndexColumn1() = "SalPurCode": .IndexColumn2() = "SalPurICode"
.AddIndex: .IndexName() = "SalMptCode": .IndexColumn1() = "SalMptCode"
.AddIndex: .IndexName() = "SalPttCode": .IndexColumn1() = "SalPttCode"
.AddIndex: .IndexName() = "SalMdiCode": .IndexColumn1() = "SalMdiCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSaleDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SalCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalMptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalMdiCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalMdiRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalPurCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalPurICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalAmtBefTax": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SalICode"
Rem index definition
.AddIndex: .IndexName() = "SalICode": .IndexUnique() = True: .IndexColumn1() = "SalICode"
.AddIndex: .IndexName() = "SalCodeICode": .IndexColumn1() = "SalCode": .IndexColumn2() = "SalICode"
.AddIndex: .IndexName() = "SalCodeSNo": .IndexColumn1() = "SalCode": .IndexColumn2() = "SalSno"
.AddIndex: .IndexName() = "SalDate": .IndexColumn1() = "SalDate"
.AddIndex: .IndexName() = "SalPurCodeICode": .IndexColumn1() = "SalPurCode": .IndexColumn2() = "SalPurICode"
.AddIndex: .IndexName() = "SalMptCode": .IndexColumn1() = "SalMptCode"
.AddIndex: .IndexName() = "SalPttCode": .IndexColumn1() = "SalPttCode"
.AddIndex: .IndexName() = "SalMdiCode": .IndexColumn1() = "SalMdiCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSalePymtHdr"
Rem field definitions
.AddColumn: .ColumnName() = "SphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SphCode"
Rem index definition
.AddIndex: .IndexName() = "SphVtmCodeVchNo": .IndexColumn1() = "SphVtmCode": .IndexColumn2() = "SphVchNo"
.AddIndex: .IndexName() = "SphDate": .IndexColumn1() = "SphDate"
.AddIndex: .IndexName() = "SphPttCode": .IndexColumn1() = "SphPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSalePymtHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SphCode"
Rem index definition
.AddIndex: .IndexName() = "SphCode": .IndexUnique() = True: .IndexColumn1() = "SphCode"
.AddIndex: .IndexName() = "SphVtmCodeVchNo": .IndexColumn1() = "SphVtmCode": .IndexColumn2() = "SphVchNo"
.AddIndex: .IndexName() = "SphDate": .IndexColumn1() = "SphDate"
.AddIndex: .IndexName() = "SphPttCode": .IndexColumn1() = "SphPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSalePymtDtl"
Rem field definitions
.AddColumn: .ColumnName() = "SpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpySahCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SpyICode"
Rem index definition
.AddIndex: .IndexName() = "SpyCodeICode": .IndexColumn1() = "SpyCode": .IndexColumn2() = "SpyICode"
.AddIndex: .IndexName() = "SpyCodeSNo": .IndexColumn1() = "SpyCode": .IndexColumn2() = "SpySno"
.AddIndex: .IndexName() = "SpyDate": .IndexColumn1() = "SpyDate"
.AddIndex: .IndexName() = "SpyPttCode": .IndexColumn1() = "SpyPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSalePymtDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpySahCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SpyICode"
Rem index definition
.AddIndex: .IndexName() = "SpyICode": .IndexUnique() = True: .IndexColumn1() = "SpyICode"
.AddIndex: .IndexName() = "SpyCodeICode": .IndexColumn1() = "SpyCode": .IndexColumn2() = "SpyICode"
.AddIndex: .IndexName() = "SpyCodeSNo": .IndexColumn1() = "SpyCode": .IndexColumn2() = "SpySno"
.AddIndex: .IndexName() = "SpyDate": .IndexColumn1() = "SpyDate"
.AddIndex: .IndexName() = "SpyPttCode": .IndexColumn1() = "SpyPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSaleRefdHdr"
Rem field definitions
.AddColumn: .ColumnName() = "SfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SfhCode"
Rem index definition
.AddIndex: .IndexName() = "SfhVtmCodeVchNo": .IndexColumn1() = "SfhVtmCode": .IndexColumn2() = "SfhVchNo"
.AddIndex: .IndexName() = "SfhDate": .IndexColumn1() = "SfhDate"
.AddIndex: .IndexName() = "SfhPttCode": .IndexColumn1() = "SfhPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSaleRefdHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SfhCode"
Rem index definition
.AddIndex: .IndexName() = "SfhCode": .IndexUnique() = True: .IndexColumn1() = "SfhCode"
.AddIndex: .IndexName() = "SfhVtmCodeVchNo": .IndexColumn1() = "SfhVtmCode": .IndexColumn2() = "SfhVchNo"
.AddIndex: .IndexName() = "SfhDate": .IndexColumn1() = "SfhDate"
.AddIndex: .IndexName() = "SfhPttCode": .IndexColumn1() = "SfhPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSaleRefdDtl"
Rem field definitions
.AddColumn: .ColumnName() = "SfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdSahCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SfdICode"
Rem index definition
.AddIndex: .IndexName() = "SfdCodeICode": .IndexColumn1() = "SfdCode": .IndexColumn2() = "SfdICode"
.AddIndex: .IndexName() = "SfdCodeSNo": .IndexColumn1() = "SfdCode": .IndexColumn2() = "SfdSno"
.AddIndex: .IndexName() = "SfdDate": .IndexColumn1() = "SfdDate"
.AddIndex: .IndexName() = "SfdPttCode": .IndexColumn1() = "SfdPttCode"

.CreateTable dbVgnCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedSaleRefdDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdSahCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SfdICode"
Rem index definition
.AddIndex: .IndexName() = "SfdICode": .IndexUnique() = True: .IndexColumn1() = "SfdICode"
.AddIndex: .IndexName() = "SfdCodeICode": .IndexColumn1() = "SfdCode": .IndexColumn2() = "SfdICode"
.AddIndex: .IndexName() = "SfdCodeSNo": .IndexColumn1() = "SfdCode": .IndexColumn2() = "SfdSno"
.AddIndex: .IndexName() = "SfdDate": .IndexColumn1() = "SfdDate"
.AddIndex: .IndexName() = "SfdPttCode": .IndexColumn1() = "SfdPttCode"

.CreateTable dbVgnCatalog
End With









Rem InfoBox dbVgnCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbVgnDatabase

EndSub:
Set dbVgnCatalog = Nothing
Set dbVgnDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateVgnComDatabase(Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbComDatabase As New ADODB.Connection, dbComCatalog As New ADOX.Catalog, clsDB As clsDataStru
Dim mQryStr As String

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
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 64
    End If
End If

Rem link table *****************************************************************************
With clsDB
.ClearLinkStru
' -----------------------------master tables ----------------------------
.AddLink: .LinkTableName() = "DoctMast": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "DoctRoleMst": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "RefByMast": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "RefToMast": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "ServGrpMst": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "ServMast": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "PatMast": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "PatCatgMst": .LinkDbSource() = dbVgnDatabaseFullPath

Rem ---------------------------------- Store Master Tables -------------------------------
.AddLink: .LinkTableName() = "MedItmMast": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "MedItmGrpMst": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "MedPrtMast": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "MedPrtGrpMst": .LinkDbSource() = dbVgnDatabaseFullPath

.CreateLink dbComCatalog
End With

With clsDB
.ClearLinkStru
Rem ------------------------- outdoor tables ------------------------------------------------------
.AddLink: .LinkTableName() = "OutdReg": .LinkDbSource() = dbVgnDatabaseFullPath

Rem -------------------- Store Sale/Purchase/Receipt/Payment tables -----------------------------
.AddLink: .LinkTableName() = "MedPurchHdr": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "MedPurchDtl": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "MedSaleHdr": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "MedSaleDtl": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "MedSalePymtHdr": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "MedSalePymtDtl": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "MedSaleRefdHdr": .LinkDbSource() = dbVgnDatabaseFullPath
.AddLink: .LinkTableName() = "MedSaleRefdDtl": .LinkDbSource() = dbVgnDatabaseFullPath

.CreateLink dbComCatalog
End With

With clsDB
.ClearLinkStru

.CreateLink dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewOutdReg"
.CommandStr = "SELECT OutdReg.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*" _
    & " FROM ((((OutdReg" _
    & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
    & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
    & " LEFT JOIN ServMast ON OutdReg.OpgSrvCode = ServMast.SrvCode)" _
    & " INNER JOIN VTypMast on OutdReg.OpgVtmCode=VTypMast.VtmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON OutdReg.OpgPttCode = PatMast.PttCode" _

.CreateView dbComCatalog
End With

'With clsDB
'.ClearViewStru
'.ViewName = "vewOutdRcpt"
'.CommandStr = "SELECT OutdRcpt.*, OutdHdr.*, OutdReg.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*, ServGrpMst.*, OutdRcDctDtl.*, ServDoct.*, DoctRoleMst.* " _
'    & " FROM ((((((((OutdRcpt" _
'    & " INNER JOIN OutdHdr ON OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
'    & " INNER JOIN OutdReg ON OutdHdr.OhrOpgCode = OutdReg.OpgCode)" _
'    & " INNER JOIN VTypMast ON OutdHdr.OhrVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
'    & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
'    & " INNER JOIN ServMast ON OutdRcpt.OrcSrvCode = ServMast.SrvCode)" _
'    & " INNER JOIN ServGrpMst ON ServMast.SrvSgpCode = ServGrpMst.SgpCode)" _
'    & " LEFT JOIN ((OutdRcDctDtl" _
'        & " LEFT JOIN DoctMast ServDoct ON OutdRcDctDtl.OrdDctCode=ServDoct.DctCode)" _
'        & " LEFT JOIN DoctRoleMst ON OutdRcDctDtl.OrdDrlCode=DoctRoleMst.DrlCode)" _
'        & " ON OutdRcpt.OrcICode=OutdRcDctDtl.OrdOrcCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON OutdHdr.OhrPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewOutdPymt"
'.CommandStr = "SELECT OutdPymtDtl.*, OutdPymtHdr.*, OutdHdr.*, OhrVTypMast.*, OutdReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
'    & " FROM ((((OutdPymtDtl" _
'    & " INNER JOIN OutdPymtHdr ON OutdPymtDtl.OpyCode = OutdPymtHdr.OphCode)" _
'    & " INNER JOIN (OutdHdr INNER JOIN VTypMast as OhrVTypMast on OutdHdr.OhrVtmCode = OhrVTypMast.VtmCode) ON OutdPymtDtl.OpyOhrCode = OutdHdr.OhrCode)" _
'    & " INNER JOIN ((OutdReg" _
'        & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
'        & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
'        & " ON OutdPymtHdr.OphOpgCode = OutdReg.OpgCode)" _
'    & " INNER JOIN VTypMast ON OutdPymtHdr.OphVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON OutdPymtHdr.OphPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewOutdRefd"
'.CommandStr = "SELECT OutdRefdDtl.*, OutdRefdHdr.*, OutdHdr.*, OhrVTypMast.*, OutdReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
'    & " FROM ((((OutdRefdDtl" _
'    & " INNER JOIN OutdRefdHdr ON OutdRefdDtl.OfdCode = OutdRefdHdr.OfhCode)" _
'    & " INNER JOIN (OutdHdr INNER JOIN VTypMast as OhrVTypMast on OutdHdr.OhrVtmCode = OhrVTypMast.VtmCode) ON OutdRefdDtl.OfdOhrCode = OutdHdr.OhrCode)" _
'    & " INNER JOIN ((OutdReg" _
'        & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
'        & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
'        & " ON OutdRefdHdr.OfhOpgCode = OutdReg.OpgCode)" _
'    & " INNER JOIN VTypMast ON OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON OutdRefdHdr.OfhPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewOutdBill"
'.CommandStr = "SELECT OutdBill.*, OutdBlHdr.*, OutdReg.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*, ServGrpMst.*, OutdBlDctDtl.*, ServDoct.*, DoctRoleMst.* " _
'    & " FROM ((((((((OutdBill" _
'    & " INNER JOIN OutdBlHdr ON OutdBill.OblCode = OutdBlHdr.ObhCode)" _
'    & " INNER JOIN OutdReg ON OutdBlHdr.ObhOpgCode = OutdReg.OpgCode)" _
'    & " INNER JOIN VTypMast ON OutdBlHdr.ObhVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
'    & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
'    & " INNER JOIN ServMast ON OutdBill.OblSrvCode = ServMast.SrvCode)" _
'    & " INNER JOIN ServGrpMst ON ServMast.SrvSgpCode = ServGrpMst.SgpCode)" _
'    & " LEFT JOIN ((OutdBlDctDtl" _
'        & " LEFT JOIN DoctMast ServDoct ON OutdBlDctDtl.ObdDctCode=ServDoct.DctCode)" _
'        & " LEFT JOIN DoctRoleMst ON OutdBlDctDtl.ObdDrlCode=DoctRoleMst.DrlCode)" _
'        & " ON OutdBill.OblICode=OutdBlDctDtl.ObdOblCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON OutdBlHdr.ObhPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewOutdBlPymt"
'.CommandStr = "SELECT OutdBlPymtDtl.*, OutdBlPymtHdr.*, OutdBlHdr.*, ObhVTypMast.*, OutdReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
'    & " FROM ((((OutdBlPymtDtl" _
'    & " INNER JOIN OutdBlPymtHdr ON OutdBlPymtDtl.ObpyCode = OutdBlPymtHdr.ObphCode)" _
'    & " INNER JOIN (OutdBlHdr INNER JOIN VTypMast as ObhVTypMast on OutdBlHdr.ObhVtmCode = ObhVTypMast.VtmCode) ON OutdBlPymtDtl.ObpyObhCode = OutdBlHdr.ObhCode)" _
'    & " INNER JOIN ((OutdReg" _
'        & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
'        & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
'        & " ON OutdBlPymtHdr.ObphOpgCode = OutdReg.OpgCode)" _
'    & " INNER JOIN VTypMast ON OutdBlPymtHdr.ObphVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON OutdBlPymtHdr.ObphPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewOutdBlRefd"
'.CommandStr = "SELECT OutdBlRefdDtl.*, OutdBlRefdHdr.*, OutdBlHdr.*, ObhVTypMast.*, OutdReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
'    & " FROM ((((OutdBlRefdDtl" _
'    & " INNER JOIN OutdBlRefdHdr ON OutdBlRefdDtl.ObfdCode = OutdBlRefdHdr.ObfhCode)" _
'    & " INNER JOIN (OutdBlHdr INNER JOIN VTypMast as ObhVTypMast on OutdBlHdr.ObhVtmCode = ObhVTypMast.VtmCode) ON OutdBlRefdDtl.ObfdObhCode = OutdBlHdr.ObhCode)" _
'    & " INNER JOIN ((OutdReg" _
'        & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
'        & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
'        & " ON OutdBlRefdHdr.ObfhOpgCode = OutdReg.OpgCode)" _
'    & " INNER JOIN VTypMast ON OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON OutdBlRefdHdr.ObfhPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewIndrReg"
'.CommandStr = "SELECT IndrReg.*, PatMast.*, BedMast.*, FloorMast.*, WardMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*" _
'    & " FROM ((((IndrReg" _
'    & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
'    & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
'    & " INNER JOIN VTypMast on IndrReg.IpgVtmCode=VTypMast.VtmCode)" _
'    & " INNER JOIN ((BedMast" _
'        & " INNER JOIN FloorMast on BedMast.BdmFlrCode = FloorMast.FlrCode)" _
'        & " INNER JOIN WardMast on BedMast.BdmWrdCode = WardMast.WrdCode)" _
'        & " ON IndrReg.IpgBdmCode = BedMast.BdmCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON IndrReg.IpgPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewIndrRcpt"
'.CommandStr = "SELECT IndrRcpt.*, IndrHdr.*, IndrReg.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*, ServGrpMst.*, IndrRcDctDtl.*, ServDoct.*, DoctRoleMst.* " _
'    & " FROM (((((IndrRcpt" _
'    & " INNER JOIN IndrHdr ON IndrRcpt.IrcCode = IndrHdr.IhrCode)" _
'    & " INNER JOIN VTypMast ON IndrHdr.IhrVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN (ServMast" _
'        & " INNER JOIN ServGrpMst ON ServMast.SrvSgpCode = ServGrpMst.SgpCode)" _
'        & " ON IndrRcpt.IrcSrvCode = ServMast.SrvCode)" _
'    & " INNER JOIN ((IndrReg" _
'        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
'        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
'        & " ON IndrHdr.IhrIpgCode = IndrReg.IpgCode)" _
'    & " LEFT JOIN ((IndrRcDctDtl" _
'        & " LEFT JOIN DoctMast ServDoct ON IndrRcDctDtl.IrdDctCode=ServDoct.DctCode)" _
'        & " LEFT JOIN DoctRoleMst ON IndrRcDctDtl.IrdDrlCode=DoctRoleMst.DrlCode)" _
'        & " ON IndrRcpt.IrcICode=IndrRcDctDtl.IrdIrcCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON IndrHdr.IhrPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewIndrPymt"
'.CommandStr = "SELECT IndrPymtDtl.*, IndrPymtHdr.*, IndrHdr.*, IhrVTypMast.*, IndrReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
'    & " FROM ((((IndrPymtDtl" _
'    & " INNER JOIN IndrPymtHdr ON IndrPymtDtl.IpyCode = IndrPymtHdr.IphCode)" _
'    & " INNER JOIN (IndrHdr INNER JOIN VTypMast as IhrVTypMast on IndrHdr.IhrVtmCode = IhrVTypMast.VtmCode) ON IndrPymtDtl.IpyIhrCode = IndrHdr.IhrCode)" _
'    & " INNER JOIN ((IndrReg" _
'        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
'        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
'        & " ON IndrPymtHdr.IphIpgCode = IndrReg.IpgCode)" _
'    & " INNER JOIN VTypMast ON IndrPymtHdr.IphVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON IndrPymtHdr.IphPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewIndrRefd"
'.CommandStr = "SELECT IndrRefdDtl.*, IndrRefdHdr.*, IndrHdr.*, IhrVTypMast.*, IndrReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
'    & " FROM ((((IndrRefdDtl" _
'    & " INNER JOIN IndrRefdHdr ON IndrRefdDtl.IfdCode = IndrRefdHdr.IfhCode)" _
'    & " INNER JOIN (IndrHdr INNER JOIN VTypMast as IhrVTypMast on IndrHdr.IhrVtmCode = IhrVTypMast.VtmCode) ON IndrRefdDtl.IfdIhrCode = IndrHdr.IhrCode)" _
'    & " INNER JOIN ((IndrReg" _
'        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
'        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
'        & " ON IndrRefdHdr.IfhIpgCode = IndrReg.IpgCode)" _
'    & " INNER JOIN VTypMast ON IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON IndrRefdHdr.IfhPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewIndrBill"
'.CommandStr = "SELECT IndrBill.*, IndrBlHdr.*, IndrReg.*, WardMast.*, FloorMast.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*, IndrBlDctDtl.*" _
'    & ", BedMast.BdmCode, BedMast.BdmName, BedMast.BdmFlrCode, BedMast.BdmWrdCode, BedMast.BdmSrvCode, BedMast.BdmIndex, BedMast.BdmCharges, ServGrpMst.SgpCode, ServGrpMst.SgpName, ServGrpMst.SgpIndex, ServGrpMst.SgpExpanded, ServDoct.DctCode, ServDoct.DctTitle, ServDoct.DctName, ServDoct.DctSpeci, ServDoct.DctDcgCode, DoctRoleMst.DrlCode, DoctRoleMst.DrlName " _
'    & " FROM (((((IndrBill" _
'    & " INNER JOIN IndrBlHdr ON IndrBill.IblCode = IndrBlHdr.IbhCode)" _
'    & " INNER JOIN VTypMast ON IndrBlHdr.IbhVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN (ServMast" _
'        & " INNER JOIN ServGrpMst ON ServMast.SrvSgpCode = ServGrpMst.SgpCode)" _
'        & "  ON IndrBill.IblSrvCode = ServMast.SrvCode)" _
'    & " INNER JOIN (((IndrReg" _
'        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
'        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
'        & " INNER JOIN ((BedMast" _
'            & " INNER JOIN FloorMast on BedMast.BdmFlrCode = FloorMast.FlrCode)" _
'            & " INNER JOIN WardMast on BedMast.BdmWrdCode = WardMast.WrdCode)" _
'            & " ON IndrReg.IpgBdmCode = BedMast.BdmCode)" _
'        & " ON IndrBlHdr.IbhIpgCode = IndrReg.IpgCode)" _
'    & " LEFT JOIN ((IndrBlDctDtl" _
'        & " LEFT JOIN DoctMast ServDoct ON IndrBlDctDtl.IbdDctCode=ServDoct.DctCode)" _
'        & " LEFT JOIN DoctRoleMst ON IndrBlDctDtl.IbdDrlCode=DoctRoleMst.DrlCode)" _
'        & " ON IndrBill.IblICode=IndrBlDctDtl.IbdIblCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON IndrBlHdr.IbhPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewIndrBlPymt"
'.CommandStr = "SELECT IndrBlPymtDtl.*, IndrBlPymtHdr.*, IndrBlHdr.*, IbhVTypMast.*, IndrReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
'    & " FROM ((((IndrBlPymtDtl" _
'    & " INNER JOIN IndrBlPymtHdr ON IndrBlPymtDtl.IbpyCode = IndrBlPymtHdr.IbphCode)" _
'    & " INNER JOIN (IndrBlHdr INNER JOIN VTypMast as IbhVTypMast on IndrBlHdr.IbhVtmCode = IbhVTypMast.VtmCode) ON IndrBlPymtDtl.IbpyIbhCode = IndrBlHdr.IbhCode)" _
'    & " INNER JOIN ((IndrReg" _
'        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
'        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
'        & " ON IndrBlPymtHdr.IbphIpgCode = IndrReg.IpgCode)" _
'    & " INNER JOIN VTypMast ON IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON IndrBlPymtHdr.IbphPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With
'
'With clsDB
'.ClearViewStru
'.ViewName = "vewIndrBlRefd"
'.CommandStr = "SELECT IndrBlRefdDtl.*, IndrBlRefdHdr.*, IndrBlHdr.*, IbhVTypMast.*, IndrReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
'    & " FROM ((((IndrBlRefdDtl" _
'    & " INNER JOIN IndrBlRefdHdr ON IndrBlRefdDtl.IbfdCode = IndrBlRefdHdr.IbfhCode)" _
'    & " INNER JOIN (IndrBlHdr INNER JOIN VTypMast as IbhVTypMast on IndrBlHdr.IbhVtmCode = IbhVTypMast.VtmCode) ON IndrBlRefdDtl.IbfdIbhCode = IndrBlHdr.IbhCode)" _
'    & " INNER JOIN ((IndrReg" _
'        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
'        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
'        & " ON IndrBlRefdHdr.IbfhIpgCode = IndrReg.IpgCode)" _
'    & " INNER JOIN VTypMast ON IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode)" _
'    & " INNER JOIN ((PatMast" _
'        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'        & " ON IndrBlRefdHdr.IbfhPttCode = PatMast.PttCode"
'
'.CreateView dbComCatalog
'End With

'With clsDB
'.ClearViewStru
'.ViewName = "vewCollDtl"
'
'Rem query formation
'mQryStr = "Select t1.*,PatMast.*,AreaMast.AraName,StsnMast.StnName,DoctMast.DctTitle,DoctMast.DctName" _
' & ",TrnOIVTypMast.VtmSysCode as TrnOIVtmSysCode,TrnOIVTypMast.VtmName as TrnOIVtmName,TrnOIVTypMast.VtmAbvr as TrnOIVtmAbvr" _
' & ",TrnVTypMast.VtmSysCode as TrnVtmSysCode,TrnVTypMast.VtmName as TrnVtmName,TrnVTypMast.VtmAbvr as TrnVtmAbvr" _
' & ",format(TrnDate,'yyyymmdd')+TrnType+format(TrnCode,'" & CStr(cLONGCODESTRFMT) & "') as tTrnSmryId"
'mQryStr = mQryStr & " from (((("
'Rem reserved query string producing no records
'mQryStr = mQryStr & "Select " _
' & "'Opg' as TrnType,OpgCode as TrnCode,OpgDate as TrnDate,OpgTime as TrnTime" _
' & ",OpgPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
' & ",OpgVtmCode as TrnVtmCode,OpgVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
' & ",OpgAmtAftDisc as TrnAmtAftDisc,OpgDiscAmt as TrnDiscAmt" _
' & " from OutdReg" _
' & " where OpgCode > 0 and True = False"
'Rem outdoor registration
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Opg' as TrnType,OpgCode as TrnCode,OpgDate as TrnDate,OpgTime as TrnTime" _
' & ",OpgPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
' & ",OpgVtmCode as TrnVtmCode,OpgVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
' & ",OpgAmtAftDisc as TrnAmtAftDisc,OpgDiscAmt as TrnDiscAmt" _
' & " from OutdReg" _
' & " where OpgCode > 0"
'Rem outdoor receipt received amount
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Orc' as TrnType,OhrCode as TrnCode,OhrDate as TrnDate,OhrTime as TrnTime" _
' & ",OhrPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
' & ",OhrVtmCode as TrnVtmCode,OhrVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
' & ",OhrRecdAmt as TrnAmtAftDisc,OhrDiscAmt as TrnDiscAmt" _
' & " from OutdHdr" _
' & " Inner Join OutdReg on OutdHdr.OhrOpgCode = OutdReg.OpgCode" _
' & " where OhrCode > 0"
'Rem outdoor payment
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Opy' as TrnType,OphCode as TrnCode,OphDate as TrnDate,OphTime as TrnTime" _
' & ",OphPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
' & ",OphVtmCode as TrnVtmCode,OphVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
' & ",OphDepoAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from OutdPymtHdr" _
' & " Inner Join OutdReg on OutdPymtHdr.OphOpgCode = OutdReg.OpgCode" _
' & " where OphCode > 0"
'Rem outdoor refund
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Ofd' as TrnType,OfhCode as TrnCode,OfhDate as TrnDate,OfhTime as TrnTime" _
' & ",OfhPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
' & ",OfhVtmCode as TrnVtmCode,OfhVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
' & ",OfhRefuAmt * -1 as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from OutdRefdHdr" _
' & " Inner Join OutdReg on OutdRefdHdr.OfhOpgCode = OutdReg.OpgCode" _
' & " where OfhCode > 0"
'Rem outdoor bill payment
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Obpy' as TrnType,ObphCode as TrnCode,ObphDate as TrnDate,ObphTime as TrnTime" _
' & ",ObphPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
' & ",ObphVtmCode as TrnVtmCode,ObphVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
' & ",ObphDepoAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from OutdBlPymtHdr" _
' & " Inner Join OutdReg on OutdBlPymtHdr.ObphOpgCode = OutdReg.OpgCode" _
' & " where ObphCode > 0"
'Rem outdoor bill refund
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Obfd' as TrnType,ObfhCode as TrnCode,ObfhDate as TrnDate,ObfhTime as TrnTime" _
' & ",ObfhPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
' & ",ObfhVtmCode as TrnVtmCode,ObfhVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
' & ",ObfhRefuAmt * -1 as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from OutdBlRefdHdr" _
' & " Inner Join OutdReg on OutdBlRefdHdr.ObfhOpgCode = OutdReg.OpgCode" _
' & " where ObfhCode > 0"
'Rem indoor advance ---------------------
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Ipg' as TrnType,IpgCode as TrnCode,IpgDate as TrnDate,IpgTime as TrnTime" _
' & ",IpgPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
' & ",IpgVtmCode as TrnVtmCode,IpgVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
' & ",IpgAdvAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from IndrReg" _
' & " where IpgCode > 0 and IpgAdvAmt > 0"
'Rem indoor receipt received amount
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Irc' as TrnType,IhrCode as TrnCode,IhrDate as TrnDate,IhrTime as TrnTime" _
' & ",IhrPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
' & ",IhrVtmCode as TrnVtmCode,IhrVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
' & ",IhrRecdAmt as TrnAmtAftDisc,IhrDiscAmt as TrnDiscAmt" _
' & " from IndrHdr" _
' & " Inner Join IndrReg on IndrHdr.IhrIpgCode = IndrReg.IpgCode" _
' & " where IhrCode > 0"
'Rem indoor payment
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Ipy' as TrnType,IphCode as TrnCode,IphDate as TrnDate,IphTime as TrnTime" _
' & ",IphPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
' & ",IphVtmCode as TrnVtmCode,IphVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
' & ",IphDepoAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from IndrPymtHdr" _
' & " Inner Join IndrReg on IndrPymtHdr.IphIpgCode = IndrReg.IpgCode" _
' & " where IphCode > 0"
'Rem indoor refund
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Ifd' as TrnType,IfhCode as TrnCode,IfhDate as TrnDate,IfhTime as TrnTime" _
' & ",IfhPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
' & ",IfhVtmCode as TrnVtmCode,IfhVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
' & ",IfhRefuAmt * -1 as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from IndrRefdHdr" _
' & " Inner Join IndrReg on IndrRefdHdr.IfhIpgCode = IndrReg.IpgCode" _
' & " where IfhCode > 0"
'Rem indoor bill payment
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Ibpy' as TrnType,IbphCode as TrnCode,IbphDate as TrnDate,IbphTime as TrnTime" _
' & ",IbphPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
' & ",IbphVtmCode as TrnVtmCode,IbphVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
' & ",IbphDepoAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from IndrBlPymtHdr" _
' & " Inner Join IndrReg on IndrBlPymtHdr.IbphIpgCode = IndrReg.IpgCode" _
' & " where IbphCode > 0"
'Rem indoor bill refund
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Ibfd' as TrnType,IbfhCode as TrnCode,IbfhDate as TrnDate,IbfhTime as TrnTime" _
' & ",IbfhPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
' & ",IbfhVtmCode as TrnVtmCode,IbfhVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
' & ",IbfhRefuAmt * -1 as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from IndrBlRefdHdr" _
' & " Inner Join IndrReg on IndrBlRefdHdr.IbfhIpgCode = IndrReg.IpgCode" _
' & " where IbfhCode > 0"
'Rem indoor on a/c payment
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Igt' as TrnType,IgtCode as TrnCode,IgtDate as TrnDate,IgtTime as TrnTime" _
' & ",IgtPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
' & ",IgtVtmCode as TrnVtmCode,IgtVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
' & ",IgtDpogAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from IndrRgPymt" _
' & " Inner Join IndrReg on IndrRgPymt.IgtIpgCode = IndrReg.IpgCode" _
' & " where IgtCode > 0"
'Rem indoor on a/c refund
'mQryStr = mQryStr & " UNION ALL "
'mQryStr = mQryStr & " Select " _
' & "'Igf' as TrnType,IgfCode as TrnCode,IgfDate as TrnDate,IgfTime as TrnTime" _
' & ",IgfPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
' & ",IgfVtmCode as TrnVtmCode,IgfVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
' & ",IgfRfugAmt * -1 as TrnAmtAftDisc,0 as TrnDiscAmt" _
' & " from IndrRgRefd" _
' & " Inner Join IndrReg on IndrRgRefd.IgfIpgCode = IndrReg.IpgCode" _
' & " where IgfCode > 0"
'Rem ----------------------------------
'mQryStr = mQryStr & ") as t1"
'mQryStr = mQryStr & " INNER JOIN ((PatMast" _
'    & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'    & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'    & " on t1.TrnPttCode = PatMast.PttCode)" _
'    & " inner join DoctMast as DoctMast on t1.TrnDctCode = DoctMast.DctCode)" _
'    & " inner join VTypMast as TrnOIVTypMast on t1.TrnOIVtmCode = TrnOIVTypMast.VtmCode)" _
'    & " inner join VTypMast as TrnVTypMast on t1.TrnVtmCode = TrnVTypMast.VtmCode" _
'    & " order by t1.TrnDate,t1.TrnTime,t1.TrnType,t1.TrnCode"
'
'.CommandStr = mQryStr
'.CreateView dbComCatalog
'End With





Rem InfoBox dbComCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbComDatabase

EndSub:
Set dbComCatalog = Nothing
Set dbComDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Rem ************************************* END OF CLASS *********************************************

