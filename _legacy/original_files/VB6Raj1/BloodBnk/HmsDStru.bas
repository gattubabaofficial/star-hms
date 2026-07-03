Attribute VB_Name = "HmsDataStru"

Option Explicit

Public Sub CreateHmsMastDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbHmsDatabase As New ADODB.Connection, dbHmsCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbHmsDatabaseFullPath) = "" Then
        dbHmsCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbHmsDatabaseFullPath
        Set dbHmsCatalog = Nothing
    Else
        ErrorBox "Database " & dbHmsDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenHmsDataSource dbHmsDatabase, mExclusiveMode:=True
If dbHmsDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbHmsCatalog.ActiveConnection = dbHmsDatabase
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
End With
Rem temp updations
dbHmsCatalog.ActiveConnection.Execute "Update ServMast set SrvRate = SrvOpdGenChg where isnull(SrvRate)"

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

.CreateTable dbHmsCatalog
End With
dbHmsCatalog.ActiveConnection.Execute "Update ServMast_Log set SrvRate = SrvOpdGenChg where isnull(SrvRate)"

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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
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

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "FloorMast"
Rem field definitions
.AddColumn: .ColumnName() = "FlrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "FlrName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FlrShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FlrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
Rem primary key definition
.PrimaryKey = "FlrCode"
Rem index definition
.AddIndex: .IndexName() = "FlrName": .IndexUnique() = True: .IndexColumn1() = "FlrName"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "FloorMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "FlrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FlrName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "FlrShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "FlrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
Rem primary key definition
Rem .PrimaryKey = "FlrCode"
Rem index definition
.AddIndex: .IndexName() = "FlrCode": .IndexUnique() = True: .IndexColumn1() = "FlrCode"
.AddIndex: .IndexName() = "FlrName": .IndexUnique() = True: .IndexColumn1() = "FlrName"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "WardMast"
Rem field definitions
.AddColumn: .ColumnName() = "WrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "WrdName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "WrdShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "WrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
Rem primary key definition
.PrimaryKey = "WrdCode"
Rem index definition
.AddIndex: .IndexName() = "WrdName": .IndexUnique() = True: .IndexColumn1() = "WrdName"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "WardMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "WrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "WrdName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "WrdShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "WrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
Rem primary key definition
Rem .PrimaryKey = "WrdCode"
Rem index definition
.AddIndex: .IndexName() = "WrdCode": .IndexUnique() = True: .IndexColumn1() = "WrdCode"
.AddIndex: .IndexName() = "WrdName": .IndexUnique() = True: .IndexColumn1() = "WrdName"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BedMast"
Rem field definitions
.AddColumn: .ColumnName() = "BdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "BdmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdmFlrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmWrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmCharges": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmDiscPer": .ColumnType() = adSingle: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmChkOutTimeBasis": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmChkTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmFreeAllot": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "BdmCode"
Rem index definition
.AddIndex: .IndexName() = "BdmName": .IndexUnique() = True: .IndexColumn1() = "BdmName"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BedMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "BdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdmFlrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmWrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmIndex": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmCharges": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmDiscAllowed": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmDiscPer": .ColumnType() = adSingle: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmChkOutTimeBasis": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmChkTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmFreeAllot": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "BdmCode"
Rem index definition
.AddIndex: .IndexName() = "BdmCode": .IndexUnique() = True: .IndexColumn1() = "BdmCode"
.AddIndex: .IndexName() = "BdmName": .IndexUnique() = True: .IndexColumn1() = "BdmName"

.CreateTable dbHmsCatalog
End With







Rem InfoBox dbHmsCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbHmsDatabase

EndSub:
Set dbHmsCatalog = Nothing
Set dbHmsDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateHmsMdsMastDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbHmsDatabase As New ADODB.Connection, dbHmsCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbHmsDatabaseFullPath) = "" Then
        dbHmsCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbHmsDatabaseFullPath
        Set dbHmsCatalog = Nothing
    Else
        ErrorBox "Database " & dbHmsDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenHmsDataSource dbHmsDatabase, mExclusiveMode:=True
If dbHmsDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbHmsCatalog.ActiveConnection = dbHmsDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 9
    End If
End If

With clsDB
.ClearTableStru
.TableName = "SubItmMast"
Rem field definitions
.AddColumn: .ColumnName() = "SimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SimName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SimSigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimPurchRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimMRPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimSaleRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SimCode"
Rem index definition
.AddIndex: .IndexName() = "SimName": .IndexUnique() = True: .IndexColumn1() = "SimName"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SubItmMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SimSigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimPurchRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimMRPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimSaleRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SimCode"
Rem index definition
.AddIndex: .IndexName() = "SimCode": .IndexUnique() = True: .IndexColumn1() = "SimCode"
.AddIndex: .IndexName() = "SimName": .IndexUnique() = True: .IndexColumn1() = "SimName"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SubItmGrpMst"
Rem field definitions
.AddColumn: .ColumnName() = "SigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SigDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SigCode"
Rem index definition
.AddIndex: .IndexName() = "SigName": .IndexUnique() = True: .IndexColumn1() = "SigName"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SubItmGrpMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SigDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SigCode"
Rem index definition
.AddIndex: .IndexName() = "SigCode": .IndexUnique() = True: .IndexColumn1() = "SigCode"
.AddIndex: .IndexName() = "SigName": .IndexUnique() = True: .IndexColumn1() = "SigName"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PartyMast"
Rem field definitions
.AddColumn: .ColumnName() = "PrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PrtTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PrtPgmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PartyMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PrtTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PrtName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PrtPgmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PartyGrpMst"
Rem field definitions
.AddColumn: .ColumnName() = "PgmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PgmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PgmDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PgmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "PgmCode"
Rem index definition
.AddIndex: .IndexName() = "PgmName": .IndexUnique() = True: .IndexColumn1() = "PgmName"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PartyGrpMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PgmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PgmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PgmDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PgmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "PgmCode"
Rem index definition
.AddIndex: .IndexName() = "PgmCode": .IndexUnique() = True: .IndexColumn1() = "PgmCode"
.AddIndex: .IndexName() = "PgmName": .IndexUnique() = True: .IndexColumn1() = "PgmName"

.CreateTable dbHmsCatalog
End With













Rem InfoBox dbHmsCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbHmsDatabase

EndSub:
Set dbHmsCatalog = Nothing
Set dbHmsDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub



Public Sub CreateHmsOpdTranDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbHmsDatabase As New ADODB.Connection, dbHmsCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbHmsDatabaseFullPath) = "" Then
        dbHmsCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbHmsDatabaseFullPath
        Set dbHmsCatalog = Nothing
    Else
        ErrorBox "Database " & dbHmsDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenHmsDataSource dbHmsDatabase, mExclusiveMode:=True
If dbHmsDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbHmsCatalog.ActiveConnection = dbHmsDatabase
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
.AddColumn: .ColumnName() = "OpgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OpgCode"
Rem index definition
.AddIndex: .IndexName() = "OpgVchNo": .IndexColumn1() = "OpgVchNo"
.AddIndex: .IndexName() = "OpgDate": .IndexColumn1() = "OpgDate"
.AddIndex: .IndexName() = "OpgPttCode": .IndexColumn1() = "OpgPttCode"

.CreateTable dbHmsCatalog
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
.AddColumn: .ColumnName() = "OpgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpgCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "OpgCode"
Rem index definition
.AddIndex: .IndexName() = "OpgCode": .IndexUnique() = True: .IndexColumn1() = "OpgCode"
.AddIndex: .IndexName() = "OpgVchNo": .IndexColumn1() = "OpgVchNo"
.AddIndex: .IndexName() = "OpgDate": .IndexColumn1() = "OpgDate"
.AddIndex: .IndexName() = "OpgPttCode": .IndexColumn1() = "OpgPttCode"

.CreateTable dbHmsCatalog
End With

' -------------------------------------- outdoor receipts section -----------------------------------------
With clsDB
.ClearTableStru
.TableName = "OutdHdr"
Rem field definitions
.AddColumn: .ColumnName() = "OhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OhrOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrOldOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OhrCode"
Rem index definition
.AddIndex: .IndexName() = "OhrVtmCodeVchNo": .IndexColumn1() = "OhrVtmCode": .IndexColumn2() = "OhrVchNo"
.AddIndex: .IndexName() = "OhrDate": .IndexColumn1() = "OhrDate"
.AddIndex: .IndexName() = "OhrPttCode": .IndexColumn1() = "OhrPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrOldOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "OhrCode"
Rem index definition
.AddIndex: .IndexName() = "OhrCode": .IndexColumn1() = "OhrCode": .IndexUnique() = True
.AddIndex: .IndexName() = "OhrVtmCodeVchNo": .IndexColumn1() = "OhrVtmCode": .IndexColumn2() = "OhrVchNo"
.AddIndex: .IndexName() = "OhrDate": .IndexColumn1() = "OhrDate"
.AddIndex: .IndexName() = "OhrPttCode": .IndexColumn1() = "OhrPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRcpt"
Rem field definitions
.AddColumn: .ColumnName() = "OrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OrcICode"
Rem index definition
.AddIndex: .IndexName() = "OrcCodeICode": .IndexColumn1() = "OrcCode": .IndexColumn2() = "OrcICode"
.AddIndex: .IndexName() = "OrcCodeSNo": .IndexColumn1() = "OrcCode": .IndexColumn2() = "OrcSno"
.AddIndex: .IndexName() = "OrcDate": .IndexColumn1() = "OrcDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRcpt_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "OrcICode"
Rem index definition
.AddIndex: .IndexName() = "OrcICode": .IndexColumn1() = "OrcICode": .IndexUnique() = True
.AddIndex: .IndexName() = "OrcCodeICode": .IndexColumn1() = "OrcCode": .IndexColumn2() = "OrcICode"
.AddIndex: .IndexName() = "OrcCodeSNo": .IndexColumn1() = "OrcCode": .IndexColumn2() = "OrcSno"
.AddIndex: .IndexName() = "OrcDate": .IndexColumn1() = "OrcDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRcDctDtl"
Rem field definitions
.AddColumn: .ColumnName() = "OrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdOrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OrdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OrdICode"
Rem index definition
.AddIndex: .IndexName() = "OrdTranCode": .IndexColumn1() = "OrdCode": .IndexColumn2() = "OrdOrcCode": .IndexColumn3() = "OrdICode"
.AddIndex: .IndexName() = "OrdShowCode": .IndexColumn1() = "OrdCode": .IndexColumn2() = "OrdOrcCode": .IndexColumn3() = "OrdSno"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRcDctDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdOrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "OrdICode"
Rem index definition
.AddIndex: .IndexName() = "OrdICode": .IndexUnique() = True: .IndexColumn1() = "OrdICode"
.AddIndex: .IndexName() = "OrdTranCode": .IndexColumn1() = "OrdCode": .IndexColumn2() = "OrdOrcCode": .IndexColumn3() = "OrdICode"
.AddIndex: .IndexName() = "OrdShowCode": .IndexColumn1() = "OrdCode": .IndexColumn2() = "OrdOrcCode": .IndexColumn3() = "OrdSno"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdPymtHdr"
Rem field definitions
.AddColumn: .ColumnName() = "OphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OphOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphOldOphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OphCode"
Rem index definition
.AddIndex: .IndexName() = "OphVtmCodeVchNo": .IndexColumn1() = "OphVtmCode": .IndexColumn2() = "OphVchNo"
.AddIndex: .IndexName() = "OphDate": .IndexColumn1() = "OphDate"
.AddIndex: .IndexName() = "OphPttCode": .IndexColumn1() = "OphPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdPymtHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphOldOphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "OphCode"
Rem index definition
.AddIndex: .IndexName() = "OphCode": .IndexUnique() = True: .IndexColumn1() = "OphCode"
.AddIndex: .IndexName() = "OphVtmCodeVchNo": .IndexColumn1() = "OphVtmCode": .IndexColumn2() = "OphVchNo"
.AddIndex: .IndexName() = "OphDate": .IndexColumn1() = "OphDate"
.AddIndex: .IndexName() = "OphPttCode": .IndexColumn1() = "OphPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdPymtDtl"
Rem field definitions
.AddColumn: .ColumnName() = "OpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OpyICode"
Rem index definition
.AddIndex: .IndexName() = "OpyCodeICode": .IndexColumn1() = "OpyCode": .IndexColumn2() = "OpyICode"
.AddIndex: .IndexName() = "OpyCodeSNo": .IndexColumn1() = "OpyCode": .IndexColumn2() = "OpySno"
.AddIndex: .IndexName() = "OpyDate": .IndexColumn1() = "OpyDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdPymtDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "OpyICode"
Rem index definition
.AddIndex: .IndexName() = "OpyICode": .IndexUnique() = True: .IndexColumn1() = "OpyICode"
.AddIndex: .IndexName() = "OpyCodeICode": .IndexColumn1() = "OpyCode": .IndexColumn2() = "OpyICode"
.AddIndex: .IndexName() = "OpyCodeSNo": .IndexColumn1() = "OpyCode": .IndexColumn2() = "OpySno"
.AddIndex: .IndexName() = "OpyDate": .IndexColumn1() = "OpyDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRefdHdr"
Rem field definitions
.AddColumn: .ColumnName() = "OfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OfhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhOldOfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OfhCode"
Rem index definition
.AddIndex: .IndexName() = "OfhVtmCodeVchNo": .IndexColumn1() = "OfhVtmCode": .IndexColumn2() = "OfhVchNo"
.AddIndex: .IndexName() = "OfhDate": .IndexColumn1() = "OfhDate"
.AddIndex: .IndexName() = "OfhPttCode": .IndexColumn1() = "OfhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRefdHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhOldOfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "OfhCode"
Rem index definition
.AddIndex: .IndexName() = "OfhCode": .IndexUnique() = True: .IndexColumn1() = "OfhCode"
.AddIndex: .IndexName() = "OfhVtmCodeVchNo": .IndexColumn1() = "OfhVtmCode": .IndexColumn2() = "OfhVchNo"
.AddIndex: .IndexName() = "OfhDate": .IndexColumn1() = "OfhDate"
.AddIndex: .IndexName() = "OfhPttCode": .IndexColumn1() = "OfhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRefdDtl"
Rem field definitions
.AddColumn: .ColumnName() = "OfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OfdICode"
Rem index definition
.AddIndex: .IndexName() = "OfdCodeICode": .IndexColumn1() = "OfdCode": .IndexColumn2() = "OfdICode"
.AddIndex: .IndexName() = "OfdCodeSNo": .IndexColumn1() = "OfdCode": .IndexColumn2() = "OfdSno"
.AddIndex: .IndexName() = "OfdDate": .IndexColumn1() = "OfdDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRefdDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "OfdICode"
Rem index definition
.AddIndex: .IndexName() = "OfdICode": .IndexUnique() = True: .IndexColumn1() = "OfdICode"
.AddIndex: .IndexName() = "OfdCodeICode": .IndexColumn1() = "OfdCode": .IndexColumn2() = "OfdICode"
.AddIndex: .IndexName() = "OfdCodeSNo": .IndexColumn1() = "OfdCode": .IndexColumn2() = "OfdSno"
.AddIndex: .IndexName() = "OfdDate": .IndexColumn1() = "OfdDate"

.CreateTable dbHmsCatalog
End With

' -------------------------------------- outdoor bill section -----------------------------------------
With clsDB
.ClearTableStru
.TableName = "OutdBlHdr"
Rem field definitions
.AddColumn: .ColumnName() = "ObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "ObhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhOldObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "ObhCode"
Rem index definition
.AddIndex: .IndexName() = "ObhVtmCodeVchNo": .IndexColumn1() = "ObhVtmCode": .IndexColumn2() = "ObhVchNo"
.AddIndex: .IndexName() = "ObhDate": .IndexColumn1() = "ObhDate"
.AddIndex: .IndexName() = "ObhPttCode": .IndexColumn1() = "ObhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "ObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhOldObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "ObhCode"
Rem index definition
.AddIndex: .IndexName() = "ObhCode": .IndexUnique() = True: .IndexColumn1() = "ObhCode"
.AddIndex: .IndexName() = "ObhVtmCodeVchNo": .IndexColumn1() = "ObhVtmCode": .IndexColumn2() = "ObhVchNo"
.AddIndex: .IndexName() = "ObhDate": .IndexColumn1() = "ObhDate"
.AddIndex: .IndexName() = "ObhPttCode": .IndexColumn1() = "ObhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBill"
Rem field definitions
.AddColumn: .ColumnName() = "OblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OblSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OblICode"
Rem index definition
.AddIndex: .IndexName() = "OblCodeICode": .IndexColumn1() = "OblCode": .IndexColumn2() = "OblICode"
.AddIndex: .IndexName() = "OblCodeSNo": .IndexColumn1() = "OblCode": .IndexColumn2() = "OblSno"
.AddIndex: .IndexName() = "OblDate": .IndexColumn1() = "OblDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBill_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OblRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OblCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "OblICode"
Rem index definition
.AddIndex: .IndexName() = "OblICode": .IndexUnique() = True: .IndexColumn1() = "OblICode"
.AddIndex: .IndexName() = "OblCodeICode": .IndexColumn1() = "OblCode": .IndexColumn2() = "OblICode"
.AddIndex: .IndexName() = "OblCodeSNo": .IndexColumn1() = "OblCode": .IndexColumn2() = "OblSno"
.AddIndex: .IndexName() = "OblDate": .IndexColumn1() = "OblDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlDctDtl"
Rem field definitions
.AddColumn: .ColumnName() = "ObdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdOblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "ObdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "ObdICode"
Rem index definition
.AddIndex: .IndexName() = "ObdTranCode": .IndexColumn1() = "ObdCode": .IndexColumn2() = "ObdOblCode": .IndexColumn3() = "ObdICode"
.AddIndex: .IndexName() = "ObdShowCode": .IndexColumn1() = "ObdCode": .IndexColumn2() = "ObdOblCode": .IndexColumn3() = "ObdSno"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlDctDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "ObdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdOblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "ObdICode"
Rem index definition
.AddIndex: .IndexName() = "ObdICode": .IndexUnique() = True: .IndexColumn1() = "ObdICode"
.AddIndex: .IndexName() = "ObdTranCode": .IndexColumn1() = "ObdCode": .IndexColumn2() = "ObdOblCode": .IndexColumn3() = "ObdICode"
.AddIndex: .IndexName() = "ObdShowCode": .IndexColumn1() = "ObdCode": .IndexColumn2() = "ObdOblCode": .IndexColumn3() = "ObdSno"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlPymtHdr"
Rem field definitions
.AddColumn: .ColumnName() = "ObphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "ObphOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphOldObphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "ObphCode"
Rem index definition
.AddIndex: .IndexName() = "ObphVtmCodeVchNo": .IndexColumn1() = "ObphVtmCode": .IndexColumn2() = "ObphVchNo"
.AddIndex: .IndexName() = "ObphDate": .IndexColumn1() = "ObphDate"
.AddIndex: .IndexName() = "ObphPttCode": .IndexColumn1() = "ObphPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlPymtHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "ObphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphOldObphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "ObphCode"
Rem index definition
.AddIndex: .IndexName() = "ObphCode": .IndexUnique() = True: .IndexColumn1() = "ObphCode"
.AddIndex: .IndexName() = "ObphVtmCodeVchNo": .IndexColumn1() = "ObphVtmCode": .IndexColumn2() = "ObphVchNo"
.AddIndex: .IndexName() = "ObphDate": .IndexColumn1() = "ObphDate"
.AddIndex: .IndexName() = "ObphPttCode": .IndexColumn1() = "ObphPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlPymtDtl"
Rem field definitions
.AddColumn: .ColumnName() = "ObpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "ObpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpyObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "ObpyICode"
Rem index definition
.AddIndex: .IndexName() = "ObpyCodeICode": .IndexColumn1() = "ObpyCode": .IndexColumn2() = "ObpyICode"
.AddIndex: .IndexName() = "ObpyCodeSNo": .IndexColumn1() = "ObpyCode": .IndexColumn2() = "ObpySno"
.AddIndex: .IndexName() = "ObpyDate": .IndexColumn1() = "ObpyDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlPymtDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "ObpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpyObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "ObpyICode"
Rem index definition
.AddIndex: .IndexName() = "ObpyICode": .IndexUnique() = True: .IndexColumn1() = "ObpyICode"
.AddIndex: .IndexName() = "ObpyCodeICode": .IndexColumn1() = "ObpyCode": .IndexColumn2() = "ObpyICode"
.AddIndex: .IndexName() = "ObpyCodeSNo": .IndexColumn1() = "ObpyCode": .IndexColumn2() = "ObpySno"
.AddIndex: .IndexName() = "ObpyDate": .IndexColumn1() = "ObpyDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlRefdHdr"
Rem field definitions
.AddColumn: .ColumnName() = "ObfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "ObfhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhOldObfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "ObfhCode"
Rem index definition
.AddIndex: .IndexName() = "ObfhVtmCodeVchNo": .IndexColumn1() = "ObfhVtmCode": .IndexColumn2() = "ObfhVchNo"
.AddIndex: .IndexName() = "ObfhDate": .IndexColumn1() = "ObfhDate"
.AddIndex: .IndexName() = "ObfhPttCode": .IndexColumn1() = "ObfhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlRefdHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "ObfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhOldObfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "ObfhCode"
Rem index definition
.AddIndex: .IndexName() = "ObfhCode": .IndexUnique() = True: .IndexColumn1() = "ObfhCode"
.AddIndex: .IndexName() = "ObfhVtmCodeVchNo": .IndexColumn1() = "ObfhVtmCode": .IndexColumn2() = "ObfhVchNo"
.AddIndex: .IndexName() = "ObfhDate": .IndexColumn1() = "ObfhDate"
.AddIndex: .IndexName() = "ObfhPttCode": .IndexColumn1() = "ObfhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlRefdDtl"
Rem field definitions
.AddColumn: .ColumnName() = "ObfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "ObfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "ObfdICode"
Rem index definition
.AddIndex: .IndexName() = "ObfdCodeICode": .IndexColumn1() = "ObfdCode": .IndexColumn2() = "ObfdICode"
.AddIndex: .IndexName() = "ObfdCodeSNo": .IndexColumn1() = "ObfdCode": .IndexColumn2() = "ObfdSno"
.AddIndex: .IndexName() = "ObfdDate": .IndexColumn1() = "ObfdDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdBlRefdDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "ObfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "ObfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "ObfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "ObfdICode"
Rem index definition
.AddIndex: .IndexName() = "ObfdICode": .IndexUnique() = True: .IndexColumn1() = "ObfdICode"
.AddIndex: .IndexName() = "ObfdCodeICode": .IndexColumn1() = "ObfdCode": .IndexColumn2() = "ObfdICode"
.AddIndex: .IndexName() = "ObfdCodeSNo": .IndexColumn1() = "ObfdCode": .IndexColumn2() = "ObfdSno"
.AddIndex: .IndexName() = "ObfdDate": .IndexColumn1() = "ObfdDate"

.CreateTable dbHmsCatalog
End With








Rem InfoBox dbHmsCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbHmsDatabase

EndSub:
Set dbHmsCatalog = Nothing
Set dbHmsDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateHmsIpdTranDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbHmsDatabase As New ADODB.Connection, dbHmsCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbHmsDatabaseFullPath) = "" Then
        dbHmsCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbHmsDatabaseFullPath
        Set dbHmsCatalog = Nothing
    Else
        ErrorBox "Database " & dbHmsDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenHmsDataSource dbHmsDatabase, mExclusiveMode:=True
If dbHmsDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbHmsCatalog.ActiveConnection = dbHmsDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 44
    End If
End If

Rem ------------------------------- indoor tables part first -------------------------------------------------------------

CreateHmsIpdRegDatabase dbHmsCatalog, clsDB

' ------------------------------------------------- indoor receipt section ---------------------------------
With clsDB
.ClearTableStru
.TableName = "IndrHdr"
Rem field definitions
.AddColumn: .ColumnName() = "IhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IhrIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrOldIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IhrCode"
Rem index definition
.AddIndex: .IndexName() = "IhrVtmCodeVchNo": .IndexColumn1() = "IhrVtmCode": .IndexColumn2() = "IhrVchNo"
.AddIndex: .IndexName() = "IhrDate": .IndexColumn1() = "IhrDate"
.AddIndex: .IndexName() = "IhrPttCode": .IndexColumn1() = "IhrPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrOldIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IhrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IhrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IhrCode"
Rem index definition
.AddIndex: .IndexName() = "IhrCode": .IndexColumn1() = "IhrCode": .IndexUnique() = True
.AddIndex: .IndexName() = "IhrVtmCodeVchNo": .IndexColumn1() = "IhrVtmCode": .IndexColumn2() = "IhrVchNo"
.AddIndex: .IndexName() = "IhrDate": .IndexColumn1() = "IhrDate"
.AddIndex: .IndexName() = "IhrPttCode": .IndexColumn1() = "IhrPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRcpt"
Rem field definitions
.AddColumn: .ColumnName() = "IrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IrcICode"
Rem index definition
.AddIndex: .IndexName() = "IrcCodeICode": .IndexColumn1() = "IrcCode": .IndexColumn2() = "IrcICode"
.AddIndex: .IndexName() = "IrcCodeSNo": .IndexColumn1() = "IrcCode": .IndexColumn2() = "IrcSno"
.AddIndex: .IndexName() = "IrcDate": .IndexColumn1() = "IrcDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRcpt_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrcCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IrcICode"
Rem index definition
.AddIndex: .IndexName() = "IrcICode": .IndexColumn1() = "IrcICode": .IndexUnique() = True
.AddIndex: .IndexName() = "IrcCodeICode": .IndexColumn1() = "IrcCode": .IndexColumn2() = "IrcICode"
.AddIndex: .IndexName() = "IrcCodeSNo": .IndexColumn1() = "IrcCode": .IndexColumn2() = "IrcSno"
.AddIndex: .IndexName() = "IrcDate": .IndexColumn1() = "IrcDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRcDctDtl"
Rem field definitions
.AddColumn: .ColumnName() = "IrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdIrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IrdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IrdICode"
Rem index definition
.AddIndex: .IndexName() = "IrdTranCode": .IndexColumn1() = "IrdCode": .IndexColumn2() = "IrdIrcCode": .IndexColumn3() = "IrdICode"
.AddIndex: .IndexName() = "IrdShowCode": .IndexColumn1() = "IrdCode": .IndexColumn2() = "IrdIrcCode": .IndexColumn3() = "IrdSno"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRcDctDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdIrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IrdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IrdICode"
Rem index definition
.AddIndex: .IndexName() = "IrdICode": .IndexUnique() = True: .IndexColumn1() = "IrdICode"
.AddIndex: .IndexName() = "IrdTranCode": .IndexColumn1() = "IrdCode": .IndexColumn2() = "IrdIrcCode": .IndexColumn3() = "IrdICode"
.AddIndex: .IndexName() = "IrdShowCode": .IndexColumn1() = "IrdCode": .IndexColumn2() = "IrdIrcCode": .IndexColumn3() = "IrdSno"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrPymtHdr"
Rem field definitions
.AddColumn: .ColumnName() = "IphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IphIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphOldIphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IphCode"
Rem index definition
.AddIndex: .IndexName() = "IphVtmCodeVchNo": .IndexColumn1() = "IphVtmCode": .IndexColumn2() = "IphVchNo"
.AddIndex: .IndexName() = "IphDate": .IndexColumn1() = "IphDate"
.AddIndex: .IndexName() = "IphPttCode": .IndexColumn1() = "IphPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrPymtHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphOldIphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IphCode"
Rem index definition
.AddIndex: .IndexName() = "IphCode": .IndexUnique() = True: .IndexColumn1() = "IphCode"
.AddIndex: .IndexName() = "IphVtmCodeVchNo": .IndexColumn1() = "IphVtmCode": .IndexColumn2() = "IphVchNo"
.AddIndex: .IndexName() = "IphDate": .IndexColumn1() = "IphDate"
.AddIndex: .IndexName() = "IphPttCode": .IndexColumn1() = "IphPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrPymtDtl"
Rem field definitions
.AddColumn: .ColumnName() = "IpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpyIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IpyICode"
Rem index definition
.AddIndex: .IndexName() = "IpyCodeICode": .IndexColumn1() = "IpyCode": .IndexColumn2() = "IpyICode"
.AddIndex: .IndexName() = "IpyCodeSNo": .IndexColumn1() = "IpyCode": .IndexColumn2() = "IpySno"
.AddIndex: .IndexName() = "IpyDate": .IndexColumn1() = "IpyDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrPymtDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpyIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IpyICode"
Rem index definition
.AddIndex: .IndexName() = "IpyICode": .IndexUnique() = True: .IndexColumn1() = "IpyICode"
.AddIndex: .IndexName() = "IpyCodeICode": .IndexColumn1() = "IpyCode": .IndexColumn2() = "IpyICode"
.AddIndex: .IndexName() = "IpyCodeSNo": .IndexColumn1() = "IpyCode": .IndexColumn2() = "IpySno"
.AddIndex: .IndexName() = "IpyDate": .IndexColumn1() = "IpyDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRefdHdr"
Rem field definitions
.AddColumn: .ColumnName() = "IfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IfhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhOldIfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IfhCode"
Rem index definition
.AddIndex: .IndexName() = "IfhVtmCodeVchNo": .IndexColumn1() = "IfhVtmCode": .IndexColumn2() = "IfhVchNo"
.AddIndex: .IndexName() = "IfhDate": .IndexColumn1() = "IfhDate"
.AddIndex: .IndexName() = "IfhPttCode": .IndexColumn1() = "IfhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRefdHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhOldIfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IfhCode"
Rem index definition
.AddIndex: .IndexName() = "IfhCode": .IndexUnique() = True: .IndexColumn1() = "IfhCode"
.AddIndex: .IndexName() = "IfhVtmCodeVchNo": .IndexColumn1() = "IfhVtmCode": .IndexColumn2() = "IfhVchNo"
.AddIndex: .IndexName() = "IfhDate": .IndexColumn1() = "IfhDate"
.AddIndex: .IndexName() = "IfhPttCode": .IndexColumn1() = "IfhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRefdDtl"
Rem field definitions
.AddColumn: .ColumnName() = "IfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IfdICode"
Rem index definition
.AddIndex: .IndexName() = "IfdCodeICode": .IndexColumn1() = "IfdCode": .IndexColumn2() = "IfdICode"
.AddIndex: .IndexName() = "IfdCodeSNo": .IndexColumn1() = "IfdCode": .IndexColumn2() = "IfdSno"
.AddIndex: .IndexName() = "IfdDate": .IndexColumn1() = "IfdDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRefdDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IfdICode"
Rem index definition
.AddIndex: .IndexName() = "IfdICode": .IndexUnique() = True: .IndexColumn1() = "IfdICode"
.AddIndex: .IndexName() = "IfdCodeICode": .IndexColumn1() = "IfdCode": .IndexColumn2() = "IfdICode"
.AddIndex: .IndexName() = "IfdCodeSNo": .IndexColumn1() = "IfdCode": .IndexColumn2() = "IfdSno"
.AddIndex: .IndexName() = "IfdDate": .IndexColumn1() = "IfdDate"

.CreateTable dbHmsCatalog
End With

' ----------------------------------- indoor bill section --------------------------------------------------
With clsDB
.ClearTableStru
.TableName = "IndrBlHdr"
Rem field definitions
.AddColumn: .ColumnName() = "IbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhOldIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IbhCode"
Rem index definition
.AddIndex: .IndexName() = "IbhVtmCodeVchNo": .IndexColumn1() = "IbhVtmCode": .IndexColumn2() = "IbhVchNo"
.AddIndex: .IndexName() = "IbhDate": .IndexColumn1() = "IbhDate"
.AddIndex: .IndexName() = "IbhPttCode": .IndexColumn1() = "IbhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhOldIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IbhCode"
Rem index definition
.AddIndex: .IndexName() = "IbhCode": .IndexColumn1() = "IbhCode": .IndexUnique() = True
.AddIndex: .IndexName() = "IbhVtmCodeVchNo": .IndexColumn1() = "IbhVtmCode": .IndexColumn2() = "IbhVchNo"
.AddIndex: .IndexName() = "IbhDate": .IndexColumn1() = "IbhDate"
.AddIndex: .IndexName() = "IbhPttCode": .IndexColumn1() = "IbhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBill"
Rem field definitions
.AddColumn: .ColumnName() = "IblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IblSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IblICode"
Rem index definition
.AddIndex: .IndexName() = "IblCodeICode": .IndexColumn1() = "IblCode": .IndexColumn2() = "IblICode"
.AddIndex: .IndexName() = "IblCodeSNo": .IndexColumn1() = "IblCode": .IndexColumn2() = "IblSno"
.AddIndex: .IndexName() = "IblDate": .IndexColumn1() = "IblDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBill_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IblRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IblCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IblICode"
Rem index definition
.AddIndex: .IndexName() = "IblICode": .IndexColumn1() = "IblICode": .IndexUnique() = True
.AddIndex: .IndexName() = "IblCodeICode": .IndexColumn1() = "IblCode": .IndexColumn2() = "IblICode"
.AddIndex: .IndexName() = "IblCodeSNo": .IndexColumn1() = "IblCode": .IndexColumn2() = "IblSno"
.AddIndex: .IndexName() = "IblDate": .IndexColumn1() = "IblDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlIbsDtl"
Rem field definitions
.AddColumn: .ColumnName() = "IbbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsIblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbbsIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsFromDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsFromTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsToDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsToTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsUnit": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbbsCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IbbsICode"
Rem index definition
.AddIndex: .IndexName() = "IbbsTrnCode": .IndexColumn1() = "IbbsCode": .IndexColumn2() = "IbbsIblICode": .IndexColumn3() = "IbbsICode"
.AddIndex: .IndexName() = "IbbsIbsCode": .IndexColumn1() = "IbbsIbsCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlIbsDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IbbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsIblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsFromDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsFromTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsToDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsToTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsUnit": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbbsCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbbsRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IbbsICode"
Rem index definition
.AddIndex: .IndexName() = "IbbsICode": .IndexUnique() = True: .IndexColumn1() = "IbbsICode"
.AddIndex: .IndexName() = "IbbsTrnCode": .IndexColumn1() = "IbbsCode": .IndexColumn2() = "IbbsIblICode": .IndexColumn3() = "IbbsICode"
.AddIndex: .IndexName() = "IbbsIbsCode": .IndexColumn1() = "IbbsIbsCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlDctDtl"
Rem field definitions
.AddColumn: .ColumnName() = "IbdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdIblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IbdICode"
Rem index definition
.AddIndex: .IndexName() = "IbdTranCode": .IndexColumn1() = "IbdCode": .IndexColumn2() = "IbdIblCode": .IndexColumn3() = "IbdICode"
.AddIndex: .IndexName() = "IbdShowCode": .IndexColumn1() = "IbdCode": .IndexColumn2() = "IbdIblCode": .IndexColumn3() = "IbdSno"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlDctDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IbdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdIblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IbdICode"
Rem index definition
.AddIndex: .IndexName() = "IbdICode": .IndexUnique() = True: .IndexColumn1() = "IbdICode"
.AddIndex: .IndexName() = "IbdTranCode": .IndexColumn1() = "IbdCode": .IndexColumn2() = "IbdIblCode": .IndexColumn3() = "IbdICode"
.AddIndex: .IndexName() = "IbdShowCode": .IndexColumn1() = "IbdCode": .IndexColumn2() = "IbdIblCode": .IndexColumn3() = "IbdSno"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlDpogDtl"
Rem field definitions
.AddColumn: .ColumnName() = "IbgdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbgdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgdIgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgdDpogAmt": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbgdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IbgdICode"
Rem index definition
.AddIndex: .IndexName() = "IbgdCodeICode": .IndexColumn1() = "IbgdCode": .IndexColumn2() = "IbgdICode"
.AddIndex: .IndexName() = "IbgdCodeSno": .IndexColumn1() = "IbgdCode": .IndexColumn2() = "IbgdSno"
.AddIndex: .IndexName() = "IbgdIgtCode": .IndexColumn1() = "IbgdIgtCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlDpogDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IbgdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbgdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgdIgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgdDpogAmt": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbgdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IbgdICode"
Rem index definition
.AddIndex: .IndexName() = "IbgdICode": .IndexUnique() = True: .IndexColumn1() = "IbgdICode"
.AddIndex: .IndexName() = "IbgdCodeICode": .IndexColumn1() = "IbgdCode": .IndexColumn2() = "IbgdICode"
.AddIndex: .IndexName() = "IbgdCodeSno": .IndexColumn1() = "IbgdCode": .IndexColumn2() = "IbgdSno"
.AddIndex: .IndexName() = "IbgdIgtCode": .IndexColumn1() = "IbgdIgtCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlRfugDtl"
Rem field definitions
.AddColumn: .ColumnName() = "IbgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbgfSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfIgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfRfugAmt": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbgfCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IbgfICode"
Rem index definition
.AddIndex: .IndexName() = "IbgfCodeICode": .IndexColumn1() = "IbgfCode": .IndexColumn2() = "IbgfICode"
.AddIndex: .IndexName() = "IbgfCodeSno": .IndexColumn1() = "IbgfCode": .IndexColumn2() = "IbgfSno"
.AddIndex: .IndexName() = "IbgfIgfCode": .IndexColumn1() = "IbgfIgfCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlRfugDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IbgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfIgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfRfugAmt": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbgfCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbgfRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IbgfICode"
Rem index definition
.AddIndex: .IndexName() = "IbgfICode": .IndexUnique() = True: .IndexColumn1() = "IbgfICode"
.AddIndex: .IndexName() = "IbgfCodeICode": .IndexColumn1() = "IbgfCode": .IndexColumn2() = "IbgfICode"
.AddIndex: .IndexName() = "IbgfCodeSno": .IndexColumn1() = "IbgfCode": .IndexColumn2() = "IbgfSno"
.AddIndex: .IndexName() = "IbgfIgfCode": .IndexColumn1() = "IbgfIgfCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlPymtHdr"
Rem field definitions
.AddColumn: .ColumnName() = "IbphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbphIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphOldIbphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IbphCode"
Rem index definition
.AddIndex: .IndexName() = "IbphVtmCodeVchNo": .IndexColumn1() = "IbphVtmCode": .IndexColumn2() = "IbphVchNo"
.AddIndex: .IndexName() = "IbphDate": .IndexColumn1() = "IbphDate"
.AddIndex: .IndexName() = "IbphPttCode": .IndexColumn1() = "IbphPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlPymtHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IbphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphOldIbphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IbphCode"
Rem index definition
.AddIndex: .IndexName() = "IbphCode": .IndexUnique() = True: .IndexColumn1() = "IbphCode"
.AddIndex: .IndexName() = "IbphVtmCodeVchNo": .IndexColumn1() = "IbphVtmCode": .IndexColumn2() = "IbphVchNo"
.AddIndex: .IndexName() = "IbphDate": .IndexColumn1() = "IbphDate"
.AddIndex: .IndexName() = "IbphPttCode": .IndexColumn1() = "IbphPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlPymtDtl"
Rem field definitions
.AddColumn: .ColumnName() = "IbpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpyIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IbpyICode"
Rem index definition
.AddIndex: .IndexName() = "IbpyCodeICode": .IndexColumn1() = "IbpyCode": .IndexColumn2() = "IbpyICode"
.AddIndex: .IndexName() = "IbpyCodeSNo": .IndexColumn1() = "IbpyCode": .IndexColumn2() = "IbpySno"
.AddIndex: .IndexName() = "IbpyDate": .IndexColumn1() = "IbpyDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlPymtDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IbpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpyIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IbpyICode"
Rem index definition
.AddIndex: .IndexName() = "IbpyICode": .IndexUnique() = True: .IndexColumn1() = "IbpyICode"
.AddIndex: .IndexName() = "IbpyCodeICode": .IndexColumn1() = "IbpyCode": .IndexColumn2() = "IbpyICode"
.AddIndex: .IndexName() = "IbpyCodeSNo": .IndexColumn1() = "IbpyCode": .IndexColumn2() = "IbpySno"
.AddIndex: .IndexName() = "IbpyDate": .IndexColumn1() = "IbpyDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlRefdHdr"
Rem field definitions
.AddColumn: .ColumnName() = "IbfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbfhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhOldIbfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IbfhCode"
Rem index definition
.AddIndex: .IndexName() = "IbfhVtmCodeVchNo": .IndexColumn1() = "IbfhVtmCode": .IndexColumn2() = "IbfhVchNo"
.AddIndex: .IndexName() = "IbfhDate": .IndexColumn1() = "IbfhDate"
.AddIndex: .IndexName() = "IbfhPttCode": .IndexColumn1() = "IbfhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlRefdHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IbfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhOldIbfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IbfhCode"
Rem index definition
.AddIndex: .IndexName() = "IbfhCode": .IndexUnique() = True: .IndexColumn1() = "IbfhCode"
.AddIndex: .IndexName() = "IbfhVtmCodeVchNo": .IndexColumn1() = "IbfhVtmCode": .IndexColumn2() = "IbfhVchNo"
.AddIndex: .IndexName() = "IbfhDate": .IndexColumn1() = "IbfhDate"
.AddIndex: .IndexName() = "IbfhPttCode": .IndexColumn1() = "IbfhPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlRefdDtl"
Rem field definitions
.AddColumn: .ColumnName() = "IbfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IbfdICode"
Rem index definition
.AddIndex: .IndexName() = "IbfdCodeICode": .IndexColumn1() = "IbfdCode": .IndexColumn2() = "IbfdICode"
.AddIndex: .IndexName() = "IbfdCodeSNo": .IndexColumn1() = "IbfdCode": .IndexColumn2() = "IbfdSno"
.AddIndex: .IndexName() = "IbfdDate": .IndexColumn1() = "IbfdDate"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrBlRefdDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IbfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IbfdICode"
Rem index definition
.AddIndex: .IndexName() = "IbfdICode": .IndexUnique() = True: .IndexColumn1() = "IbfdICode"
.AddIndex: .IndexName() = "IbfdCodeICode": .IndexColumn1() = "IbfdCode": .IndexColumn2() = "IbfdICode"
.AddIndex: .IndexName() = "IbfdCodeSNo": .IndexColumn1() = "IbfdCode": .IndexColumn2() = "IbfdSno"
.AddIndex: .IndexName() = "IbfdDate": .IndexColumn1() = "IbfdDate"

.CreateTable dbHmsCatalog
End With


Rem InfoBox dbHmsCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbHmsDatabase

EndSub:
Set dbHmsCatalog = Nothing
Set dbHmsDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Private Sub CreateHmsIpdRegDatabase(ByRef dbHmsCatalog As ADOX.Catalog, ByRef clsDB As clsDataStru)

With clsDB
.ClearTableStru
.TableName = "IndrReg"
Rem field definitions
.AddColumn: .ColumnName() = "IpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IpgVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgOldIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgCDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgPDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgFDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgBdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgDischDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgDischTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IpgCode"
Rem index definition
.AddIndex: .IndexName() = "IpgVchNo": .IndexColumn1() = "IpgVchNo"
.AddIndex: .IndexName() = "IpgDate": .IndexColumn1() = "IpgDate"
.AddIndex: .IndexName() = "IpgPttCode": .IndexColumn1() = "IpgPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrReg_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgOldIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgCDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgPDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgFDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgBdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgDischDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgDischTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IpgCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IpgCode"
Rem index definition
.AddIndex: .IndexName() = "IpgCode": .IndexUnique() = True: .IndexColumn1() = "IpgCode"
.AddIndex: .IndexName() = "IpgVchNo": .IndexColumn1() = "IpgVchNo"
.AddIndex: .IndexName() = "IpgDate": .IndexColumn1() = "IpgDate"
.AddIndex: .IndexName() = "IpgPttCode": .IndexColumn1() = "IpgPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IBedState"
Rem field definitions
.AddColumn: .ColumnName() = "IbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IbsSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsBdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsDischDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsDischTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsDischState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsLIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IbsCode"
Rem index definition
.AddIndex: .IndexName() = "IbsIpgIbsCode": .IndexColumn1() = "IbsIpgCode": .IndexColumn2() = "IbsCode"
.AddIndex: .IndexName() = "IbsIpgCodeSNo": .IndexColumn1() = "IbsIpgCode": .IndexColumn2() = "IbsSno"
.AddIndex: .IndexName() = "IbsVchNo": .IndexColumn1() = "IbsVchNo"
.AddIndex: .IndexName() = "IbsDate": .IndexColumn1() = "IbsDate"
.AddIndex: .IndexName() = "IbsPttCode": .IndexColumn1() = "IbsPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IBedState_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsBdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsDischDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsDischTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsDischState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsLIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IbsRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IbsCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IbsCode"
Rem index definition
.AddIndex: .IndexName() = "IbsCode": .IndexUnique() = True: .IndexColumn1() = "IbsCode"
.AddIndex: .IndexName() = "IbsIpgIbsCode": .IndexColumn1() = "IbsIpgCode": .IndexColumn2() = "IbsCode"
.AddIndex: .IndexName() = "IbsIpgCodeSNo": .IndexColumn1() = "IbsIpgCode": .IndexColumn2() = "IbsSno"
.AddIndex: .IndexName() = "IbsVchNo": .IndexColumn1() = "IbsVchNo"
.AddIndex: .IndexName() = "IbsDate": .IndexColumn1() = "IbsDate"
.AddIndex: .IndexName() = "IbsPttCode": .IndexColumn1() = "IbsPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRgPymt"
Rem field definitions
.AddColumn: .ColumnName() = "IgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IgtIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtOldIgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtAdjAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IgtCode"
Rem index definition
.AddIndex: .IndexName() = "IgtVchNo": .IndexColumn1() = "IgtVchNo"
.AddIndex: .IndexName() = "IgtDate": .IndexColumn1() = "IgtDate"
.AddIndex: .IndexName() = "IgtPttCode": .IndexColumn1() = "IgtPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRgPymt_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtOldIgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtAdjAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgtCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgtRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IgtCode"
Rem index definition
.AddIndex: .IndexName() = "IgtCode": .IndexUnique() = True: .IndexColumn1() = "IgtCode"
.AddIndex: .IndexName() = "IgtVchNo": .IndexColumn1() = "IgtVchNo"
.AddIndex: .IndexName() = "IgtDate": .IndexColumn1() = "IgtDate"
.AddIndex: .IndexName() = "IgtPttCode": .IndexColumn1() = "IgtPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRgRefd"
Rem field definitions
.AddColumn: .ColumnName() = "IgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "IgfIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfOldIgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfAdjAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "IgfCode"
Rem index definition
.AddIndex: .IndexName() = "IgfVchNo": .IndexColumn1() = "IgfVchNo"
.AddIndex: .IndexName() = "IgfDate": .IndexColumn1() = "IgfDate"
.AddIndex: .IndexName() = "IgfPttCode": .IndexColumn1() = "IgfPttCode"

.CreateTable dbHmsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "IndrRgRefd_Log"
Rem field definitions
.AddColumn: .ColumnName() = "IgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfOldIgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfAdjAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "IgfCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "IgfRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "IgfCode"
Rem index definition
.AddIndex: .IndexName() = "IgfCode": .IndexUnique() = True: .IndexColumn1() = "IgfCode"
.AddIndex: .IndexName() = "IgfVchNo": .IndexColumn1() = "IgfVchNo"
.AddIndex: .IndexName() = "IgfDate": .IndexColumn1() = "IgfDate"
.AddIndex: .IndexName() = "IgfPttCode": .IndexColumn1() = "IgfPttCode"

.CreateTable dbHmsCatalog
End With

End Sub

Public Sub CreateHmsComDatabase(Optional ByRef FormProgStatus As frmProgressStatus)
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
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 46
    End If
End If

Rem link table *****************************************************************************
With clsDB
.ClearLinkStru
' -----------------------------master tables ----------------------------
.AddLink: .LinkTableName() = "DoctMast": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "DoctRoleMst": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "RefByMast": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "RefToMast": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "ServGrpMst": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "ServMast": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "PatMast": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "BedMast": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "FloorMast": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "WardMast": .LinkDbSource() = dbHmsDatabaseFullPath
' ----------------------------- general tables ----------------------------
.AddLink: .LinkTableName() = "SubItmMast": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "SubItmGrpMst": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "PartyMast": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "PartyGrpMst": .LinkDbSource() = dbHmsDatabaseFullPath



.CreateLink dbComCatalog
End With

With clsDB
.ClearLinkStru
' --------------- outdoor tables ----------------------------
.AddLink: .LinkTableName() = "OutdReg": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdRcpt": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdRcDctDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdPymtHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdPymtDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdRefdHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdRefdDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdBlHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdBill": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdBlDctDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdBlPymtHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdBlPymtDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdBlRefdHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "OutdBlRefdDtl": .LinkDbSource() = dbHmsDatabaseFullPath

.CreateLink dbComCatalog
End With

With clsDB
.ClearLinkStru
' --------------- indoor tables -----------------------------
.AddLink: .LinkTableName() = "IndrReg": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IBedState": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrRcpt": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrRcDctDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrBlHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrBill": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrBlDctDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrBlDpogDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrBlRfugDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrRgPymt": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrRgRefd": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrPymtHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrPymtDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrRefdHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrRefdDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrBlPymtHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrBlPymtDtl": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrBlRefdHdr": .LinkDbSource() = dbHmsDatabaseFullPath
.AddLink: .LinkTableName() = "IndrBlRefdDtl": .LinkDbSource() = dbHmsDatabaseFullPath

.CreateLink dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewOutdReg"
.CommandStr = "SELECT OutdReg.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*" _
    & " FROM ((((OutdReg" _
    & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
    & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
    & " INNER JOIN ServMast ON OutdReg.OpgSrvCode = ServMast.SrvCode)" _
    & " INNER JOIN VTypMast on OutdReg.OpgVtmCode=VTypMast.VtmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON OutdReg.OpgPttCode = PatMast.PttCode" _

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewOutdRcpt"
.CommandStr = "SELECT OutdRcpt.*, OutdHdr.*, OutdReg.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*, ServGrpMst.*, OutdRcDctDtl.*, ServDoct.*, DoctRoleMst.* " _
    & " FROM ((((((((OutdRcpt" _
    & " INNER JOIN OutdHdr ON OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
    & " INNER JOIN OutdReg ON OutdHdr.OhrOpgCode = OutdReg.OpgCode)" _
    & " INNER JOIN VTypMast ON OutdHdr.OhrVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
    & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
    & " INNER JOIN ServMast ON OutdRcpt.OrcSrvCode = ServMast.SrvCode)" _
    & " INNER JOIN ServGrpMst ON ServMast.SrvSgpCode = ServGrpMst.SgpCode)" _
    & " LEFT JOIN ((OutdRcDctDtl" _
        & " LEFT JOIN DoctMast ServDoct ON OutdRcDctDtl.OrdDctCode=ServDoct.DctCode)" _
        & " LEFT JOIN DoctRoleMst ON OutdRcDctDtl.OrdDrlCode=DoctRoleMst.DrlCode)" _
        & " ON OutdRcpt.OrcICode=OutdRcDctDtl.OrdOrcCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON OutdHdr.OhrPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewOutdPymt"
.CommandStr = "SELECT OutdPymtDtl.*, OutdPymtHdr.*, OutdHdr.*, OhrVTypMast.*, OutdReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
    & " FROM ((((OutdPymtDtl" _
    & " INNER JOIN OutdPymtHdr ON OutdPymtDtl.OpyCode = OutdPymtHdr.OphCode)" _
    & " INNER JOIN (OutdHdr INNER JOIN VTypMast as OhrVTypMast on OutdHdr.OhrVtmCode = OhrVTypMast.VtmCode) ON OutdPymtDtl.OpyOhrCode = OutdHdr.OhrCode)" _
    & " INNER JOIN ((OutdReg" _
        & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
        & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
        & " ON OutdPymtHdr.OphOpgCode = OutdReg.OpgCode)" _
    & " INNER JOIN VTypMast ON OutdPymtHdr.OphVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON OutdPymtHdr.OphPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewOutdRefd"
.CommandStr = "SELECT OutdRefdDtl.*, OutdRefdHdr.*, OutdHdr.*, OhrVTypMast.*, OutdReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
    & " FROM ((((OutdRefdDtl" _
    & " INNER JOIN OutdRefdHdr ON OutdRefdDtl.OfdCode = OutdRefdHdr.OfhCode)" _
    & " INNER JOIN (OutdHdr INNER JOIN VTypMast as OhrVTypMast on OutdHdr.OhrVtmCode = OhrVTypMast.VtmCode) ON OutdRefdDtl.OfdOhrCode = OutdHdr.OhrCode)" _
    & " INNER JOIN ((OutdReg" _
        & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
        & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
        & " ON OutdRefdHdr.OfhOpgCode = OutdReg.OpgCode)" _
    & " INNER JOIN VTypMast ON OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON OutdRefdHdr.OfhPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewOutdBill"
.CommandStr = "SELECT OutdBill.*, OutdBlHdr.*, OutdReg.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*, ServGrpMst.*, OutdBlDctDtl.*, ServDoct.*, DoctRoleMst.* " _
    & " FROM ((((((((OutdBill" _
    & " INNER JOIN OutdBlHdr ON OutdBill.OblCode = OutdBlHdr.ObhCode)" _
    & " INNER JOIN OutdReg ON OutdBlHdr.ObhOpgCode = OutdReg.OpgCode)" _
    & " INNER JOIN VTypMast ON OutdBlHdr.ObhVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
    & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
    & " INNER JOIN ServMast ON OutdBill.OblSrvCode = ServMast.SrvCode)" _
    & " INNER JOIN ServGrpMst ON ServMast.SrvSgpCode = ServGrpMst.SgpCode)" _
    & " LEFT JOIN ((OutdBlDctDtl" _
        & " LEFT JOIN DoctMast ServDoct ON OutdBlDctDtl.ObdDctCode=ServDoct.DctCode)" _
        & " LEFT JOIN DoctRoleMst ON OutdBlDctDtl.ObdDrlCode=DoctRoleMst.DrlCode)" _
        & " ON OutdBill.OblICode=OutdBlDctDtl.ObdOblCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON OutdBlHdr.ObhPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewOutdBlPymt"
.CommandStr = "SELECT OutdBlPymtDtl.*, OutdBlPymtHdr.*, OutdBlHdr.*, ObhVTypMast.*, OutdReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
    & " FROM ((((OutdBlPymtDtl" _
    & " INNER JOIN OutdBlPymtHdr ON OutdBlPymtDtl.ObpyCode = OutdBlPymtHdr.ObphCode)" _
    & " INNER JOIN (OutdBlHdr INNER JOIN VTypMast as ObhVTypMast on OutdBlHdr.ObhVtmCode = ObhVTypMast.VtmCode) ON OutdBlPymtDtl.ObpyObhCode = OutdBlHdr.ObhCode)" _
    & " INNER JOIN ((OutdReg" _
        & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
        & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
        & " ON OutdBlPymtHdr.ObphOpgCode = OutdReg.OpgCode)" _
    & " INNER JOIN VTypMast ON OutdBlPymtHdr.ObphVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON OutdBlPymtHdr.ObphPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewOutdBlRefd"
.CommandStr = "SELECT OutdBlRefdDtl.*, OutdBlRefdHdr.*, OutdBlHdr.*, ObhVTypMast.*, OutdReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
    & " FROM ((((OutdBlRefdDtl" _
    & " INNER JOIN OutdBlRefdHdr ON OutdBlRefdDtl.ObfdCode = OutdBlRefdHdr.ObfhCode)" _
    & " INNER JOIN (OutdBlHdr INNER JOIN VTypMast as ObhVTypMast on OutdBlHdr.ObhVtmCode = ObhVTypMast.VtmCode) ON OutdBlRefdDtl.ObfdObhCode = OutdBlHdr.ObhCode)" _
    & " INNER JOIN ((OutdReg" _
        & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
        & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
        & " ON OutdBlRefdHdr.ObfhOpgCode = OutdReg.OpgCode)" _
    & " INNER JOIN VTypMast ON OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON OutdBlRefdHdr.ObfhPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewIndrReg"
.CommandStr = "SELECT IndrReg.*, PatMast.*, BedMast.*, FloorMast.*, WardMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*" _
    & " FROM ((((IndrReg" _
    & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
    & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
    & " INNER JOIN VTypMast on IndrReg.IpgVtmCode=VTypMast.VtmCode)" _
    & " INNER JOIN ((BedMast" _
        & " INNER JOIN FloorMast on BedMast.BdmFlrCode = FloorMast.FlrCode)" _
        & " INNER JOIN WardMast on BedMast.BdmWrdCode = WardMast.WrdCode)" _
        & " ON IndrReg.IpgBdmCode = BedMast.BdmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON IndrReg.IpgPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewIndrRcpt"
.CommandStr = "SELECT IndrRcpt.*, IndrHdr.*, IndrReg.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*, ServGrpMst.*, IndrRcDctDtl.*, ServDoct.*, DoctRoleMst.* " _
    & " FROM (((((IndrRcpt" _
    & " INNER JOIN IndrHdr ON IndrRcpt.IrcCode = IndrHdr.IhrCode)" _
    & " INNER JOIN VTypMast ON IndrHdr.IhrVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN (ServMast" _
        & " INNER JOIN ServGrpMst ON ServMast.SrvSgpCode = ServGrpMst.SgpCode)" _
        & " ON IndrRcpt.IrcSrvCode = ServMast.SrvCode)" _
    & " INNER JOIN ((IndrReg" _
        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
        & " ON IndrHdr.IhrIpgCode = IndrReg.IpgCode)" _
    & " LEFT JOIN ((IndrRcDctDtl" _
        & " LEFT JOIN DoctMast ServDoct ON IndrRcDctDtl.IrdDctCode=ServDoct.DctCode)" _
        & " LEFT JOIN DoctRoleMst ON IndrRcDctDtl.IrdDrlCode=DoctRoleMst.DrlCode)" _
        & " ON IndrRcpt.IrcICode=IndrRcDctDtl.IrdIrcCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON IndrHdr.IhrPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewIndrPymt"
.CommandStr = "SELECT IndrPymtDtl.*, IndrPymtHdr.*, IndrHdr.*, IhrVTypMast.*, IndrReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
    & " FROM ((((IndrPymtDtl" _
    & " INNER JOIN IndrPymtHdr ON IndrPymtDtl.IpyCode = IndrPymtHdr.IphCode)" _
    & " INNER JOIN (IndrHdr INNER JOIN VTypMast as IhrVTypMast on IndrHdr.IhrVtmCode = IhrVTypMast.VtmCode) ON IndrPymtDtl.IpyIhrCode = IndrHdr.IhrCode)" _
    & " INNER JOIN ((IndrReg" _
        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
        & " ON IndrPymtHdr.IphIpgCode = IndrReg.IpgCode)" _
    & " INNER JOIN VTypMast ON IndrPymtHdr.IphVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON IndrPymtHdr.IphPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewIndrRefd"
.CommandStr = "SELECT IndrRefdDtl.*, IndrRefdHdr.*, IndrHdr.*, IhrVTypMast.*, IndrReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
    & " FROM ((((IndrRefdDtl" _
    & " INNER JOIN IndrRefdHdr ON IndrRefdDtl.IfdCode = IndrRefdHdr.IfhCode)" _
    & " INNER JOIN (IndrHdr INNER JOIN VTypMast as IhrVTypMast on IndrHdr.IhrVtmCode = IhrVTypMast.VtmCode) ON IndrRefdDtl.IfdIhrCode = IndrHdr.IhrCode)" _
    & " INNER JOIN ((IndrReg" _
        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
        & " ON IndrRefdHdr.IfhIpgCode = IndrReg.IpgCode)" _
    & " INNER JOIN VTypMast ON IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON IndrRefdHdr.IfhPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewIndrBill"
.CommandStr = "SELECT IndrBill.*, IndrBlHdr.*, IndrReg.*, WardMast.*, FloorMast.*, PatMast.*, ServMast.*, DoctMast.*, RefByMast.*, StsnMast.*, AreaMast.*, VTypMast.*, IndrBlDctDtl.*" _
    & ", BedMast.BdmCode, BedMast.BdmName, BedMast.BdmFlrCode, BedMast.BdmWrdCode, BedMast.BdmSrvCode, BedMast.BdmIndex, BedMast.BdmCharges, ServGrpMst.SgpCode, ServGrpMst.SgpName, ServGrpMst.SgpIndex, ServGrpMst.SgpExpanded, ServDoct.DctCode, ServDoct.DctTitle, ServDoct.DctName, ServDoct.DctSpeci, ServDoct.DctDcgCode, DoctRoleMst.DrlCode, DoctRoleMst.DrlName " _
    & " FROM (((((IndrBill" _
    & " INNER JOIN IndrBlHdr ON IndrBill.IblCode = IndrBlHdr.IbhCode)" _
    & " INNER JOIN VTypMast ON IndrBlHdr.IbhVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN (ServMast" _
        & " INNER JOIN ServGrpMst ON ServMast.SrvSgpCode = ServGrpMst.SgpCode)" _
        & "  ON IndrBill.IblSrvCode = ServMast.SrvCode)" _
    & " INNER JOIN (((IndrReg" _
        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
        & " INNER JOIN ((BedMast" _
            & " INNER JOIN FloorMast on BedMast.BdmFlrCode = FloorMast.FlrCode)" _
            & " INNER JOIN WardMast on BedMast.BdmWrdCode = WardMast.WrdCode)" _
            & " ON IndrReg.IpgBdmCode = BedMast.BdmCode)" _
        & " ON IndrBlHdr.IbhIpgCode = IndrReg.IpgCode)" _
    & " LEFT JOIN ((IndrBlDctDtl" _
        & " LEFT JOIN DoctMast ServDoct ON IndrBlDctDtl.IbdDctCode=ServDoct.DctCode)" _
        & " LEFT JOIN DoctRoleMst ON IndrBlDctDtl.IbdDrlCode=DoctRoleMst.DrlCode)" _
        & " ON IndrBill.IblICode=IndrBlDctDtl.IbdIblCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON IndrBlHdr.IbhPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewIndrBlPymt"
.CommandStr = "SELECT IndrBlPymtDtl.*, IndrBlPymtHdr.*, IndrBlHdr.*, IbhVTypMast.*, IndrReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
    & " FROM ((((IndrBlPymtDtl" _
    & " INNER JOIN IndrBlPymtHdr ON IndrBlPymtDtl.IbpyCode = IndrBlPymtHdr.IbphCode)" _
    & " INNER JOIN (IndrBlHdr INNER JOIN VTypMast as IbhVTypMast on IndrBlHdr.IbhVtmCode = IbhVTypMast.VtmCode) ON IndrBlPymtDtl.IbpyIbhCode = IndrBlHdr.IbhCode)" _
    & " INNER JOIN ((IndrReg" _
        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
        & " ON IndrBlPymtHdr.IbphIpgCode = IndrReg.IpgCode)" _
    & " INNER JOIN VTypMast ON IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON IndrBlPymtHdr.IbphPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewIndrBlRefd"
.CommandStr = "SELECT IndrBlRefdDtl.*, IndrBlRefdHdr.*, IndrBlHdr.*, IbhVTypMast.*, IndrReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
    & " FROM ((((IndrBlRefdDtl" _
    & " INNER JOIN IndrBlRefdHdr ON IndrBlRefdDtl.IbfdCode = IndrBlRefdHdr.IbfhCode)" _
    & " INNER JOIN (IndrBlHdr INNER JOIN VTypMast as IbhVTypMast on IndrBlHdr.IbhVtmCode = IbhVTypMast.VtmCode) ON IndrBlRefdDtl.IbfdIbhCode = IndrBlHdr.IbhCode)" _
    & " INNER JOIN ((IndrReg" _
        & " INNER JOIN DoctMast ON IndrReg.IpgCDctCode = DoctMast.DctCode)" _
        & " LEFT JOIN RefByMast ON IndrReg.IpgRByCode = RefByMast.RByCode)" _
        & " ON IndrBlRefdHdr.IbfhIpgCode = IndrReg.IpgCode)" _
    & " INNER JOIN VTypMast ON IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN ((PatMast" _
        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
        & " ON IndrBlRefdHdr.IbfhPttCode = PatMast.PttCode"

.CreateView dbComCatalog
End With





With clsDB
.ClearViewStru
.ViewName = "vewCollDtl"

Rem query formation
mQryStr = "Select t1.*,PatMast.*,AreaMast.AraName,StsnMast.StnName,DoctMast.DctTitle,DoctMast.DctName" _
 & ",TrnOIVTypMast.VtmSysCode as TrnOIVtmSysCode,TrnOIVTypMast.VtmName as TrnOIVtmName,TrnOIVTypMast.VtmAbvr as TrnOIVtmAbvr" _
 & ",TrnVTypMast.VtmSysCode as TrnVtmSysCode,TrnVTypMast.VtmName as TrnVtmName,TrnVTypMast.VtmAbvr as TrnVtmAbvr" _
 & ",format(TrnDate,'yyyymmdd')+TrnType+format(TrnCode,'" & CStr(cLONGCODESTRFMT) & "') as tTrnSmryId"
mQryStr = mQryStr & " from (((("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select " _
 & "'Opg' as TrnType,OpgCode as TrnCode,OpgDate as TrnDate,OpgTime as TrnTime" _
 & ",OpgPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
 & ",OpgVtmCode as TrnVtmCode,OpgVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc,OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " where OpgCode > 0 and True = False"
Rem outdoor registration
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Opg' as TrnType,OpgCode as TrnCode,OpgDate as TrnDate,OpgTime as TrnTime" _
 & ",OpgPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
 & ",OpgVtmCode as TrnVtmCode,OpgVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc,OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " where OpgCode > 0"
Rem outdoor receipt received amount
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Orc' as TrnType,OhrCode as TrnCode,OhrDate as TrnDate,OhrTime as TrnTime" _
 & ",OhrPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
 & ",OhrVtmCode as TrnVtmCode,OhrVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
 & ",OhrRecdAmt as TrnAmtAftDisc,OhrDiscAmt as TrnDiscAmt" _
 & " from OutdHdr" _
 & " Inner Join OutdReg on OutdHdr.OhrOpgCode = OutdReg.OpgCode" _
 & " where OhrCode > 0"
Rem outdoor payment
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Opy' as TrnType,OphCode as TrnCode,OphDate as TrnDate,OphTime as TrnTime" _
 & ",OphPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
 & ",OphVtmCode as TrnVtmCode,OphVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
 & ",OphDepoAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from OutdPymtHdr" _
 & " Inner Join OutdReg on OutdPymtHdr.OphOpgCode = OutdReg.OpgCode" _
 & " where OphCode > 0"
Rem outdoor refund
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Ofd' as TrnType,OfhCode as TrnCode,OfhDate as TrnDate,OfhTime as TrnTime" _
 & ",OfhPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
 & ",OfhVtmCode as TrnVtmCode,OfhVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
 & ",OfhRefuAmt * -1 as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from OutdRefdHdr" _
 & " Inner Join OutdReg on OutdRefdHdr.OfhOpgCode = OutdReg.OpgCode" _
 & " where OfhCode > 0"
Rem outdoor bill payment
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Obpy' as TrnType,ObphCode as TrnCode,ObphDate as TrnDate,ObphTime as TrnTime" _
 & ",ObphPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
 & ",ObphVtmCode as TrnVtmCode,ObphVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
 & ",ObphDepoAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from OutdBlPymtHdr" _
 & " Inner Join OutdReg on OutdBlPymtHdr.ObphOpgCode = OutdReg.OpgCode" _
 & " where ObphCode > 0"
Rem outdoor bill refund
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Obfd' as TrnType,ObfhCode as TrnCode,ObfhDate as TrnDate,ObfhTime as TrnTime" _
 & ",ObfhPttCode as TrnPttCode,OpgCDctCode as TrnDctCode" _
 & ",ObfhVtmCode as TrnVtmCode,ObfhVchNo as TrnVchNo,OpgVtmCode as TrnOIVtmCode,OpgVchNo as TrnOIVchNo" _
 & ",ObfhRefuAmt * -1 as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from OutdBlRefdHdr" _
 & " Inner Join OutdReg on OutdBlRefdHdr.ObfhOpgCode = OutdReg.OpgCode" _
 & " where ObfhCode > 0"
Rem indoor advance ---------------------
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Ipg' as TrnType,IpgCode as TrnCode,IpgDate as TrnDate,IpgTime as TrnTime" _
 & ",IpgPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
 & ",IpgVtmCode as TrnVtmCode,IpgVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
 & ",IpgAdvAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from IndrReg" _
 & " where IpgCode > 0 and IpgAdvAmt > 0"
Rem indoor receipt received amount
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Irc' as TrnType,IhrCode as TrnCode,IhrDate as TrnDate,IhrTime as TrnTime" _
 & ",IhrPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
 & ",IhrVtmCode as TrnVtmCode,IhrVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
 & ",IhrRecdAmt as TrnAmtAftDisc,IhrDiscAmt as TrnDiscAmt" _
 & " from IndrHdr" _
 & " Inner Join IndrReg on IndrHdr.IhrIpgCode = IndrReg.IpgCode" _
 & " where IhrCode > 0"
Rem indoor payment
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Ipy' as TrnType,IphCode as TrnCode,IphDate as TrnDate,IphTime as TrnTime" _
 & ",IphPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
 & ",IphVtmCode as TrnVtmCode,IphVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
 & ",IphDepoAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from IndrPymtHdr" _
 & " Inner Join IndrReg on IndrPymtHdr.IphIpgCode = IndrReg.IpgCode" _
 & " where IphCode > 0"
Rem indoor refund
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Ifd' as TrnType,IfhCode as TrnCode,IfhDate as TrnDate,IfhTime as TrnTime" _
 & ",IfhPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
 & ",IfhVtmCode as TrnVtmCode,IfhVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
 & ",IfhRefuAmt * -1 as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from IndrRefdHdr" _
 & " Inner Join IndrReg on IndrRefdHdr.IfhIpgCode = IndrReg.IpgCode" _
 & " where IfhCode > 0"
Rem indoor bill payment
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Ibpy' as TrnType,IbphCode as TrnCode,IbphDate as TrnDate,IbphTime as TrnTime" _
 & ",IbphPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
 & ",IbphVtmCode as TrnVtmCode,IbphVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
 & ",IbphDepoAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from IndrBlPymtHdr" _
 & " Inner Join IndrReg on IndrBlPymtHdr.IbphIpgCode = IndrReg.IpgCode" _
 & " where IbphCode > 0"
Rem indoor bill refund
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Ibfd' as TrnType,IbfhCode as TrnCode,IbfhDate as TrnDate,IbfhTime as TrnTime" _
 & ",IbfhPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
 & ",IbfhVtmCode as TrnVtmCode,IbfhVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
 & ",IbfhRefuAmt * -1 as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from IndrBlRefdHdr" _
 & " Inner Join IndrReg on IndrBlRefdHdr.IbfhIpgCode = IndrReg.IpgCode" _
 & " where IbfhCode > 0"
Rem indoor on a/c payment
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Igt' as TrnType,IgtCode as TrnCode,IgtDate as TrnDate,IgtTime as TrnTime" _
 & ",IgtPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
 & ",IgtVtmCode as TrnVtmCode,IgtVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
 & ",IgtDpogAmt as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from IndrRgPymt" _
 & " Inner Join IndrReg on IndrRgPymt.IgtIpgCode = IndrReg.IpgCode" _
 & " where IgtCode > 0"
Rem indoor on a/c refund
mQryStr = mQryStr & " UNION ALL "
mQryStr = mQryStr & " Select " _
 & "'Igf' as TrnType,IgfCode as TrnCode,IgfDate as TrnDate,IgfTime as TrnTime" _
 & ",IgfPttCode as TrnPttCode,IpgCDctCode as TrnDctCode" _
 & ",IgfVtmCode as TrnVtmCode,IgfVchNo as TrnVchNo,IpgVtmCode as TrnOIVtmCode,IpgVchNo as TrnOIVchNo" _
 & ",IgfRfugAmt * -1 as TrnAmtAftDisc,0 as TrnDiscAmt" _
 & " from IndrRgRefd" _
 & " Inner Join IndrReg on IndrRgRefd.IgfIpgCode = IndrReg.IpgCode" _
 & " where IgfCode > 0"
Rem ----------------------------------
mQryStr = mQryStr & ") as t1"
mQryStr = mQryStr & " INNER JOIN ((PatMast" _
    & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
    & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
    & " on t1.TrnPttCode = PatMast.PttCode)" _
    & " inner join DoctMast as DoctMast on t1.TrnDctCode = DoctMast.DctCode)" _
    & " inner join VTypMast as TrnOIVTypMast on t1.TrnOIVtmCode = TrnOIVTypMast.VtmCode)" _
    & " inner join VTypMast as TrnVTypMast on t1.TrnVtmCode = TrnVTypMast.VtmCode" _
    & " order by t1.TrnDate,t1.TrnTime,t1.TrnType,t1.TrnCode"

.CommandStr = mQryStr
.CreateView dbComCatalog
End With





Rem InfoBox dbComCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbComDatabase

EndSub:
Set dbComCatalog = Nothing
Set dbComDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Rem ************************************* END OF CLASS *********************************************

