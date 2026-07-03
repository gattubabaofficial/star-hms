Attribute VB_Name = "BdkDataStru"

Option Explicit

Public Sub CreateBdkMastDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbBdkDatabase As New ADODB.Connection, dbBdkCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbBdkDatabaseFullPath) = "" Then
        dbBdkCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbBdkDatabaseFullPath
        Set dbBdkCatalog = Nothing
    Else
        ErrorBox "Database " & dbBdkDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenBdkDataSource dbBdkDatabase, mExclusiveMode:=True
If dbBdkDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbBdkCatalog.ActiveConnection = dbBdkDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 40
    End If
End If

With clsDB
.ClearTableStru
.TableName = "BloodGrpMst"
Rem field definitions
.AddColumn: .ColumnName() = "BdgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "BdgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdgDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "BdgCode"
Rem index definition
.AddIndex: .IndexName() = "BdgName": .IndexUnique() = True: .IndexColumn1() = "BdgName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodGrpMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "BdgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdgDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "BdgCode"
Rem index definition
.AddIndex: .IndexName() = "BdgCode": .IndexUnique() = True: .IndexColumn1() = "BdgCode"
.AddIndex: .IndexName() = "BdgName": .IndexUnique() = True: .IndexColumn1() = "BdgName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodCompoMst"
Rem field definitions
.AddColumn: .ColumnName() = "BdcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "BdcName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdcExpDays": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdcBdpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdcBldQty": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdcDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "BdcCode"
Rem index definition
.AddIndex: .IndexName() = "BdcName": .IndexUnique() = True: .IndexColumn1() = "BdcName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodCompoMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "BdcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdcName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdcExpDays": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdcBdpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdcBldQty": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdcDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "BdcCode"
Rem index definition
.AddIndex: .IndexName() = "BdcCode": .IndexUnique() = True: .IndexColumn1() = "BdcCode"
.AddIndex: .IndexName() = "BdcName": .IndexUnique() = True: .IndexColumn1() = "BdcName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodMast"
Rem field definitions
.AddColumn: .ColumnName() = "BldCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "BldName": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BldBdgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BldBdcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BldItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BldDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BldRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "BldCode"
Rem index definition
.AddIndex: .IndexName() = "BldName": .IndexUnique() = True: .IndexColumn1() = "BldName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "BldCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BldName": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BldBdgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BldBdcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BldItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BldDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BldRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "BldCode"
Rem index definition
.AddIndex: .IndexName() = "BldCode": .IndexUnique() = True: .IndexColumn1() = "BldCode"
.AddIndex: .IndexName() = "BldName": .IndexUnique() = True: .IndexColumn1() = "BldName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodPckMst"
Rem field definitions
.AddColumn: .ColumnName() = "BdpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "BdpName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdpDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdpQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "BdpCode"
Rem index definition
.AddIndex: .IndexName() = "BdpName": .IndexUnique() = True: .IndexColumn1() = "BdpName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodPckMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "BdpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdpName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BdpDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdpQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BdpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "BdpCode"
Rem index definition
.AddIndex: .IndexName() = "BdpCode": .IndexUnique() = True: .IndexColumn1() = "BdpCode"
.AddIndex: .IndexName() = "BdpName": .IndexUnique() = True: .IndexColumn1() = "BdpName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "HospCatgMst"
Rem field definitions
.AddColumn: .ColumnName() = "HcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "HcgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HcgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "HcgCode"
Rem index definition
.AddIndex: .IndexName() = "HcgName": .IndexUnique() = True: .IndexColumn1() = "HcgName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "HospCatgMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "HcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HcgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HcgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "HcgCode"
Rem index definition
.AddIndex: .IndexName() = "HcgCode": .IndexUnique() = True: .IndexColumn1() = "HcgCode"
.AddIndex: .IndexName() = "HcgName": .IndexUnique() = True: .IndexColumn1() = "HcgName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "HospMast"
Rem field definitions
.AddColumn: .ColumnName() = "HpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "HpmName": .ColumnType() = adVarWChar: .ColumnWidth() = 60: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HpmRegNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmRegDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmHcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmContPer": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "HpmCode"
Rem index definition
.AddIndex: .IndexName() = "HpmName": .IndexColumn1() = "HpmName"
.AddIndex: .IndexName() = "HpmRegNo": .IndexColumn1() = "HpmRegNo"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "HospMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "HpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HpmName": .ColumnType() = adVarWChar: .ColumnWidth() = 60: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HpmRegNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmRegDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmHcgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmContPer": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HpmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "HpmCode"
Rem index definition
.AddIndex: .IndexName() = "HpmCode": .IndexUnique() = True: .IndexColumn1() = "HpmCode"
.AddIndex: .IndexName() = "HpmName": .IndexColumn1() = "HpmName"
.AddIndex: .IndexName() = "HpmRegNo": .IndexColumn1() = "HpmRegNo"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "EntityCatgMst"
Rem field definitions
.AddColumn: .ColumnName() = "EtgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "EtgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EtgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "EtgCode"
Rem index definition
.AddIndex: .IndexName() = "EtgName": .IndexUnique() = True: .IndexColumn1() = "EtgName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "EntityCatgMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "EtgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EtgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EtgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "EtgCode"
Rem index definition
.AddIndex: .IndexName() = "EtgCode": .IndexUnique() = True: .IndexColumn1() = "EtgCode"
.AddIndex: .IndexName() = "EtgName": .IndexUnique() = True: .IndexColumn1() = "EtgName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "EntityMast"
Rem field definitions
.AddColumn: .ColumnName() = "EttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "EttName": .ColumnType() = adVarWChar: .ColumnWidth() = 60: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EttRegNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttRegDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttEtgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttSex": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttAgeAsOnDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttDob": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttRefRela": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttRefName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "EttCode"
Rem index definition
.AddIndex: .IndexName() = "EttName": .IndexColumn1() = "EttName"
.AddIndex: .IndexName() = "EttRegNo": .IndexColumn1() = "EttRegNo"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "EntityMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "EttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EttName": .ColumnType() = adVarWChar: .ColumnWidth() = 60: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EttRegNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttRegDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttEtgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttSex": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttAgeAsOnDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttDob": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttRefRela": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttRefName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EttRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "EttCode"
Rem index definition
.AddIndex: .IndexName() = "EttCode": .IndexUnique() = True: .IndexColumn1() = "EttCode"
.AddIndex: .IndexName() = "EttName": .IndexColumn1() = "EttName"
.AddIndex: .IndexName() = "EttRegNo": .IndexColumn1() = "EttRegNo"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "EFmlyCatgMst"
Rem field definitions
.AddColumn: .ColumnName() = "EfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "EfgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EfgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "EfgCode"
Rem index definition
.AddIndex: .IndexName() = "EfgName": .IndexUnique() = True: .IndexColumn1() = "EfgName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "EFmlyCatgMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "EfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EfgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EfgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "EfgCode"
Rem index definition
.AddIndex: .IndexName() = "EfgCode": .IndexUnique() = True: .IndexColumn1() = "EfgCode"
.AddIndex: .IndexName() = "EfgName": .IndexUnique() = True: .IndexColumn1() = "EfgName"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "EFamilyMast"
Rem field definitions
.AddColumn: .ColumnName() = "EfmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "EfmName": .ColumnType() = adVarWChar: .ColumnWidth() = 60: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EfmRegNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmRegDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmEfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmContPer": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "EfmCode"
Rem index definition
.AddIndex: .IndexName() = "EfmName": .IndexColumn1() = "EfmName"
.AddIndex: .IndexName() = "EfmRegNo": .IndexColumn1() = "EfmRegNo"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "EFamilyMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "EfmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EfmName": .ColumnType() = adVarWChar: .ColumnWidth() = 60: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EfmRegNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmRegDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmEfgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmContPer": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EfmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "EfmCode"
Rem index definition
.AddIndex: .IndexName() = "EfmCode": .IndexUnique() = True: .IndexColumn1() = "EfmCode"
.AddIndex: .IndexName() = "EfmName": .IndexColumn1() = "EfmName"
.AddIndex: .IndexName() = "EfmRegNo": .IndexColumn1() = "EfmRegNo"

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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
.AddColumn: .ColumnName() = "SgpEtgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpEtgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpEtgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpEtgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SgpCode"
Rem index definition
.AddIndex: .IndexName() = "SgpName": .IndexUnique() = True: .IndexColumn1() = "SgpName"

.CreateTable dbBdkCatalog
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
.AddColumn: .ColumnName() = "SgpEtgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpEtgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpEtgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpExtShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SgpEtgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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

.CreateTable dbBdkCatalog
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
.AddColumn: .ColumnName() = "SrvEtgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvEtgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvEtgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvEtgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SrvCode"
Rem index definition
.AddIndex: .IndexName() = "SrvName": .IndexUnique() = True: .IndexColumn1() = "SrvName"

.CreateTable dbBdkCatalog
End With
Rem temp updations
dbBdkCatalog.ActiveConnection.Execute "Update ServMast set SrvRate = SrvOpdGenChg where isnull(SrvRate)"

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
.AddColumn: .ColumnName() = "SrvEtgwseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseRateSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvEtgwseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseDiscSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvEtgwseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRBywseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvRTowseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvTimewseBargSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvDctwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SrvEtgwseShareSys": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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

.CreateTable dbBdkCatalog
End With
dbBdkCatalog.ActiveConnection.Execute "Update ServMast_Log set SrvRate = SrvOpdGenChg where isnull(SrvRate)"

With clsDB
.ClearTableStru
.TableName = "ServRateMst"
Rem field definitions
.AddColumn: .ColumnName() = "SrmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SrmSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmWefDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmEtgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "ServRateMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SrmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmWefDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SrmEtgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
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

.CreateTable dbBdkCatalog
End With


















Rem InfoBox dbBdkCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbBdkDatabase

EndSub:
Set dbBdkCatalog = Nothing
Set dbBdkDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateBdkTranDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbBdkDatabase As New ADODB.Connection, dbBdkCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbBdkDatabaseFullPath) = "" Then
        dbBdkCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbBdkDatabaseFullPath
        Set dbBdkCatalog = Nothing
    Else
        ErrorBox "Database " & dbBdkDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenBdkDataSource dbBdkDatabase, mExclusiveMode:=True
If dbBdkDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbBdkCatalog.ActiveConnection = dbBdkDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 22
    End If
End If

With clsDB
.ClearTableStru
.TableName = "BloodInHdr"
Rem field definitions
.AddColumn: .ColumnName() = "BihCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "BihVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihEfmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihBldQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "BihCode"
Rem index definition
.AddIndex: .IndexName() = "BihVtmCodeVchNo": .IndexColumn1() = "BihVtmCode": .IndexColumn2() = "BihVchNo"
.AddIndex: .IndexName() = "BihDate": .IndexColumn1() = "BihDate"
.AddIndex: .IndexName() = "BihEttCode": .IndexColumn1() = "BihEttCode"
.AddIndex: .IndexName() = "BihEfmCode": .IndexColumn1() = "BihEfmCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodInHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "BihCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihEfmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihBldQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BihRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BihCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "BihCode"
Rem index definition
.AddIndex: .IndexName() = "BihCode": .IndexUnique() = True: .IndexColumn1() = "BihCode"
.AddIndex: .IndexName() = "BihVtmCodeVchNo": .IndexColumn1() = "BihVtmCode": .IndexColumn2() = "BihVchNo"
.AddIndex: .IndexName() = "BihDate": .IndexColumn1() = "BihDate"
.AddIndex: .IndexName() = "BihEttCode": .IndexColumn1() = "BihEttCode"
.AddIndex: .IndexName() = "BihEfmCode": .IndexColumn1() = "BihEfmCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodInDtl"
Rem field definitions
.AddColumn: .ColumnName() = "BinCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "BinSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinEfmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinBldCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinBdgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinBdcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinBdpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinBldRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinBldExpDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinBldOkState": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinBldQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "BinICode"
Rem index definition
.AddIndex: .IndexName() = "BinCodeICode": .IndexColumn1() = "BinCode": .IndexColumn2() = "BinICode"
.AddIndex: .IndexName() = "BinCodeSNo": .IndexColumn1() = "BinCode": .IndexColumn2() = "BinSno"
.AddIndex: .IndexName() = "BinDate": .IndexColumn1() = "BinDate"
.AddIndex: .IndexName() = "BinEttCode": .IndexColumn1() = "BinEttCode"
.AddIndex: .IndexName() = "BinEfmCode": .IndexColumn1() = "BinEfmCode"
.AddIndex: .IndexName() = "BinBldCode": .IndexColumn1() = "BinBldCode"
.AddIndex: .IndexName() = "BinBdgCode": .IndexColumn1() = "BinBdgCode"
.AddIndex: .IndexName() = "BinBdcCode": .IndexColumn1() = "BinBdcCode"
.AddIndex: .IndexName() = "BinItmCode": .IndexColumn1() = "BinItmCode"
.AddIndex: .IndexName() = "BinItrCode": .IndexColumn1() = "BinItrCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodInDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "BinCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinEfmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinBldCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinBdgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinBdcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinBdpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinBldRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinBldExpDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinBldOkState": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinBldQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BinRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BinCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "BinICode"
Rem index definition
.AddIndex: .IndexName() = "BinICode": .IndexUnique() = True: .IndexColumn1() = "BinICode"
.AddIndex: .IndexName() = "BinCodeICode": .IndexColumn1() = "BinCode": .IndexColumn2() = "BinICode"
.AddIndex: .IndexName() = "BinCodeSNo": .IndexColumn1() = "BinCode": .IndexColumn2() = "BinSno"
.AddIndex: .IndexName() = "BinDate": .IndexColumn1() = "BinDate"
.AddIndex: .IndexName() = "BinEttCode": .IndexColumn1() = "BinEttCode"
.AddIndex: .IndexName() = "BinEfmCode": .IndexColumn1() = "BinEfmCode"
.AddIndex: .IndexName() = "BinBldCode": .IndexColumn1() = "BinBldCode"
.AddIndex: .IndexName() = "BinBdgCode": .IndexColumn1() = "BinBdgCode"
.AddIndex: .IndexName() = "BinBdcCode": .IndexColumn1() = "BinBdcCode"
.AddIndex: .IndexName() = "BinItmCode": .IndexColumn1() = "BinItmCode"
.AddIndex: .IndexName() = "BinItrCode": .IndexColumn1() = "BinItrCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodOutHdr"
Rem field definitions
.AddColumn: .ColumnName() = "BohCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "BohVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohHpmRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohHpmRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohBldQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "BohCode"
Rem index definition
.AddIndex: .IndexName() = "BohVtmCodeVchNo": .IndexColumn1() = "BohVtmCode": .IndexColumn2() = "BohVchNo"
.AddIndex: .IndexName() = "BohDate": .IndexColumn1() = "BohDate"
.AddIndex: .IndexName() = "BohEttCode": .IndexColumn1() = "BohEttCode"
.AddIndex: .IndexName() = "BohHpmCode": .IndexColumn1() = "BohHpmCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodOutHdr_Log"
Rem field definitions
.AddColumn: .ColumnName() = "BohCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohTrnRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohTrnRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohHpmRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohHpmRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohBldQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BohRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BohCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "BohCode"
Rem index definition
.AddIndex: .IndexName() = "BohCode": .IndexUnique() = True: .IndexColumn1() = "BohCode"
.AddIndex: .IndexName() = "BohVtmCodeVchNo": .IndexColumn1() = "BohVtmCode": .IndexColumn2() = "BohVchNo"
.AddIndex: .IndexName() = "BohDate": .IndexColumn1() = "BohDate"
.AddIndex: .IndexName() = "BohEttCode": .IndexColumn1() = "BohEttCode"
.AddIndex: .IndexName() = "BohHpmCode": .IndexColumn1() = "BohHpmCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodOutDtl"
Rem field definitions
.AddColumn: .ColumnName() = "BouCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "BouSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouBldCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBdgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBdcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBdpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBldRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouBinCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBinICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBldQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "BouICode"
Rem index definition
.AddIndex: .IndexName() = "BouCodeICode": .IndexColumn1() = "BouCode": .IndexColumn2() = "BouICode"
.AddIndex: .IndexName() = "BouCodeSNo": .IndexColumn1() = "BouCode": .IndexColumn2() = "BouSno"
.AddIndex: .IndexName() = "BouDate": .IndexColumn1() = "BouDate"
.AddIndex: .IndexName() = "BouBinCodeICode": .IndexColumn1() = "BouBinCode": .IndexColumn2() = "BouBinICode"
.AddIndex: .IndexName() = "BouEttCode": .IndexColumn1() = "BouEttCode"
.AddIndex: .IndexName() = "BouHpmCode": .IndexColumn1() = "BouHpmCode"
.AddIndex: .IndexName() = "BouBldCode": .IndexColumn1() = "BouBldCode"
.AddIndex: .IndexName() = "BouBdgCode": .IndexColumn1() = "BouBdgCode"
.AddIndex: .IndexName() = "BouBdcCode": .IndexColumn1() = "BouBdcCode"
.AddIndex: .IndexName() = "BouItmCode": .IndexColumn1() = "BouItmCode"
.AddIndex: .IndexName() = "BouItrCode": .IndexColumn1() = "BouItrCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "BloodOutDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "BouCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouBldCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBdgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBdcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBdpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBldRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouBinCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBinICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouBldQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "BouRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "BouCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "BouICode"
Rem index definition
.AddIndex: .IndexName() = "BouICode": .IndexUnique() = True: .IndexColumn1() = "BouICode"
.AddIndex: .IndexName() = "BouCodeICode": .IndexColumn1() = "BouCode": .IndexColumn2() = "BouICode"
.AddIndex: .IndexName() = "BouCodeSNo": .IndexColumn1() = "BouCode": .IndexColumn2() = "BouSno"
.AddIndex: .IndexName() = "BouDate": .IndexColumn1() = "BouDate"
.AddIndex: .IndexName() = "BouBinCodeICode": .IndexColumn1() = "BouBinCode": .IndexColumn2() = "BouBinICode"
.AddIndex: .IndexName() = "BouEttCode": .IndexColumn1() = "BouEttCode"
.AddIndex: .IndexName() = "BouHpmCode": .IndexColumn1() = "BouHpmCode"
.AddIndex: .IndexName() = "BouBldCode": .IndexColumn1() = "BouBldCode"
.AddIndex: .IndexName() = "BouBdgCode": .IndexColumn1() = "BouBdgCode"
.AddIndex: .IndexName() = "BouBdcCode": .IndexColumn1() = "BouBdcCode"
.AddIndex: .IndexName() = "BouItmCode": .IndexColumn1() = "BouItmCode"
.AddIndex: .IndexName() = "BouItrCode": .IndexColumn1() = "BouItrCode"

.CreateTable dbBdkCatalog
End With






Rem -------------------------- hospital reg. and receipt part ------------------------------------------
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
.AddColumn: .ColumnName() = "OhrHpmRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrHpmRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrOldOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrEttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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
.AddIndex: .IndexName() = "OhrEttCode": .IndexColumn1() = "OhrEttCode"
.AddIndex: .IndexName() = "OhrHpmCode": .IndexColumn1() = "OhrHpmCode"

.CreateTable dbBdkCatalog
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
.AddColumn: .ColumnName() = "OhrHpmRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 15: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrHpmRefDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrOldOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OhrEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OhrEttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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
.AddIndex: .IndexName() = "OhrEttCode": .IndexColumn1() = "OhrEttCode"
.AddIndex: .IndexName() = "OhrHpmCode": .IndexColumn1() = "OhrHpmCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRcpt"
Rem field definitions
.AddColumn: .ColumnName() = "OrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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
.AddIndex: .IndexName() = "OrcEttCode": .IndexColumn1() = "OrcEttCode"
.AddIndex: .IndexName() = "OrcHpmCode": .IndexColumn1() = "OrcHpmCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRcpt_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OrcHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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
.AddIndex: .IndexName() = "OrcEttCode": .IndexColumn1() = "OrcEttCode"
.AddIndex: .IndexName() = "OrcHpmCode": .IndexColumn1() = "OrcHpmCode"

.CreateTable dbBdkCatalog
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
.AddColumn: .ColumnName() = "OrdEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbBdkCatalog
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
.AddColumn: .ColumnName() = "OrdEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbBdkCatalog
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
.AddColumn: .ColumnName() = "OphEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OphCode"
Rem index definition
.AddIndex: .IndexName() = "OphVtmCodeVchNo": .IndexColumn1() = "OphVtmCode": .IndexColumn2() = "OphVchNo"
.AddIndex: .IndexName() = "OphDate": .IndexColumn1() = "OphDate"
.AddIndex: .IndexName() = "OphEttCode": .IndexColumn1() = "OphEttCode"
.AddIndex: .IndexName() = "OphHpmCode": .IndexColumn1() = "OphHpmCode"

.CreateTable dbBdkCatalog
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
.AddColumn: .ColumnName() = "OphEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OphHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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
.AddIndex: .IndexName() = "OphEttCode": .IndexColumn1() = "OphEttCode"
.AddIndex: .IndexName() = "OphHpmCode": .IndexColumn1() = "OphHpmCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdPymtDtl"
Rem field definitions
.AddColumn: .ColumnName() = "OpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdPymtDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OpyHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbBdkCatalog
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
.AddColumn: .ColumnName() = "OfhEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "OfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "OfhCode"
Rem index definition
.AddIndex: .IndexName() = "OfhVtmCodeVchNo": .IndexColumn1() = "OfhVtmCode": .IndexColumn2() = "OfhVchNo"
.AddIndex: .IndexName() = "OfhDate": .IndexColumn1() = "OfhDate"
.AddIndex: .IndexName() = "OfhEttCode": .IndexColumn1() = "OfhEttCode"
.AddIndex: .IndexName() = "OfhHpmCode": .IndexColumn1() = "OfhHpmCode"

.CreateTable dbBdkCatalog
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
.AddColumn: .ColumnName() = "OfhEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfhHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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
.AddIndex: .IndexName() = "OfhEttCode": .IndexColumn1() = "OfhEttCode"
.AddIndex: .IndexName() = "OfhHpmCode": .IndexColumn1() = "OfhHpmCode"

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRefdDtl"
Rem field definitions
.AddColumn: .ColumnName() = "OfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "OfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbBdkCatalog
End With

With clsDB
.ClearTableStru
.TableName = "OutdRefdDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "OfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdEttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "OfdHpmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbBdkCatalog
End With





















Rem InfoBox dbBdkCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbBdkDatabase

EndSub:
Set dbBdkCatalog = Nothing
Set dbBdkDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub





'Public Sub CreateBdkMdsMastDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
'Dim mTableStru As adTableStru, dbBdkDatabase As New ADODB.Connection, dbBdkCatalog As New ADOX.Catalog, clsDB As clsDataStru
'
'If mAddMode = True Then
'    If Dir(dbBdkDatabaseFullPath) = "" Then
'        dbBdkCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbBdkDatabaseFullPath
'        Set dbBdkCatalog = Nothing
'    Else
'        ErrorBox "Database " & dbBdkDatabaseFullPath & " already exist !!!"
'        GoTo EndSub
'    End If
'End If
'
'OpenBdkDataSource dbBdkDatabase, mExclusiveMode:=True
'If dbBdkDatabase.State <> 1 Then
'    ErrorBox Err.Description
'    GoTo EndSub
'End If
'Set dbBdkCatalog.ActiveConnection = dbBdkDatabase
'Set clsDB = New clsDataStru
'If Not FormProgStatus Is Nothing Then
'    If FormProgStatus.Visible = True Then
'        Set clsDB.FormProgStatus = FormProgStatus
'        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 9
'    End If
'End If
'
'With clsDB
'.ClearTableStru
'.TableName = "SubItmMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "SimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "SimName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SimSigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimPurchRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimMRPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimSaleRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "SimCode"
'Rem index definition
'.AddIndex: .IndexName() = "SimName": .IndexUnique() = True: .IndexColumn1() = "SimName"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "SubItmMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "SimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SimSigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimPurchRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimMRPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimSaleRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SimRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "SimCode"
'Rem index definition
'.AddIndex: .IndexName() = "SimCode": .IndexUnique() = True: .IndexColumn1() = "SimCode"
'.AddIndex: .IndexName() = "SimName": .IndexUnique() = True: .IndexColumn1() = "SimName"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "SubItmGrpMst"
'Rem field definitions
'.AddColumn: .ColumnName() = "SigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "SigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SigDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "SigCode"
'Rem index definition
'.AddIndex: .IndexName() = "SigName": .IndexUnique() = True: .IndexColumn1() = "SigName"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "SubItmGrpMst_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "SigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "SigDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "SigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "SigCode"
'Rem index definition
'.AddIndex: .IndexName() = "SigCode": .IndexUnique() = True: .IndexColumn1() = "SigCode"
'.AddIndex: .IndexName() = "SigName": .IndexUnique() = True: .IndexColumn1() = "SigName"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "PartyMast"
'Rem field definitions
'.AddColumn: .ColumnName() = "PrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "PrtTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PrtPgmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PrtAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "PrtCode"
'Rem index definition
'.AddIndex: .IndexName() = "PrtName": .IndexUnique() = True: .IndexColumn1() = "PrtName"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "PartyMast_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "PrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PrtTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PrtPgmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PrtAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtAddr": .ColumnType() = adVarWChar: .ColumnWidth() = 250: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtAraCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtStnCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtTelNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtSMSNo": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtEmail": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtShowInList": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PrtRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "PrtCode"
'Rem index definition
'.AddIndex: .IndexName() = "PrtCode": .IndexUnique() = True: .IndexColumn1() = "PrtCode"
'.AddIndex: .IndexName() = "PrtName": .IndexUnique() = True: .IndexColumn1() = "PrtName"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "PartyGrpMst"
'Rem field definitions
'.AddColumn: .ColumnName() = "PgmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "PgmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PgmDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PgmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "PgmCode"
'Rem index definition
'.AddIndex: .IndexName() = "PgmName": .IndexUnique() = True: .IndexColumn1() = "PgmName"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "PartyGrpMst_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "PgmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PgmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "PgmDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "PgmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "PgmCode"
'Rem index definition
'.AddIndex: .IndexName() = "PgmCode": .IndexUnique() = True: .IndexColumn1() = "PgmCode"
'.AddIndex: .IndexName() = "PgmName": .IndexUnique() = True: .IndexColumn1() = "PgmName"
'
'.CreateTable dbBdkCatalog
'End With
'
'
'
'
'
'
'
'
'
'
'
'
'
'Rem InfoBox dbBdkCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"
'
'CloseDataSource dbBdkDatabase
'
'EndSub:
'Set dbBdkCatalog = Nothing
'Set dbBdkDatabase = Nothing
'Set clsDB = Nothing
'Exit Sub
'
'End Sub

'Public Sub CreateBdkOpdTranDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
'Dim mTableStru As adTableStru, dbBdkDatabase As New ADODB.Connection, dbBdkCatalog As New ADOX.Catalog, clsDB As clsDataStru
'
'If mAddMode = True Then
'    If Dir(dbBdkDatabaseFullPath) = "" Then
'        dbBdkCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbBdkDatabaseFullPath
'        Set dbBdkCatalog = Nothing
'    Else
'        ErrorBox "Database " & dbBdkDatabaseFullPath & " already exist !!!"
'        GoTo EndSub
'    End If
'End If
'
'OpenBdkDataSource dbBdkDatabase, mExclusiveMode:=True
'If dbBdkDatabase.State <> 1 Then
'    ErrorBox Err.Description
'    GoTo EndSub
'End If
'Set dbBdkCatalog.ActiveConnection = dbBdkDatabase
'Set clsDB = New clsDataStru
'If Not FormProgStatus Is Nothing Then
'    If FormProgStatus.Visible = True Then
'        Set clsDB.FormProgStatus = FormProgStatus
'        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 31
'    End If
'End If
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdReg"
'Rem field definitions
'.AddColumn: .ColumnName() = "OpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "OpgVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgOldOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgCDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgPDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgFDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'Rem .AddColumn: .ColumnName() = "OpgPttWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "OpgCode"
'Rem index definition
'.AddIndex: .IndexName() = "OpgVchNo": .IndexColumn1() = "OpgVchNo"
'.AddIndex: .IndexName() = "OpgDate": .IndexColumn1() = "OpgDate"
'.AddIndex: .IndexName() = "OpgPttCode": .IndexColumn1() = "OpgPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdReg_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "OpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgOldOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgCDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgPDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgFDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'Rem .AddColumn: .ColumnName() = "OpgPttWeight": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpgCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "OpgCode"
'Rem index definition
'.AddIndex: .IndexName() = "OpgCode": .IndexUnique() = True: .IndexColumn1() = "OpgCode"
'.AddIndex: .IndexName() = "OpgVchNo": .IndexColumn1() = "OpgVchNo"
'.AddIndex: .IndexName() = "OpgDate": .IndexColumn1() = "OpgDate"
'.AddIndex: .IndexName() = "OpgPttCode": .IndexColumn1() = "OpgPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'' -------------------------------------- outdoor receipts section -----------------------------------------
'With clsDB
'.ClearTableStru
'.TableName = "OutdHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "OhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "OhrOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrOldOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "OhrCode"
'Rem index definition
'.AddIndex: .IndexName() = "OhrVtmCodeVchNo": .IndexColumn1() = "OhrVtmCode": .IndexColumn2() = "OhrVchNo"
'.AddIndex: .IndexName() = "OhrDate": .IndexColumn1() = "OhrDate"
'.AddIndex: .IndexName() = "OhrPttCode": .IndexColumn1() = "OhrPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "OhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrOldOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OhrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OhrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "OhrCode"
'Rem index definition
'.AddIndex: .IndexName() = "OhrCode": .IndexColumn1() = "OhrCode": .IndexUnique() = True
'.AddIndex: .IndexName() = "OhrVtmCodeVchNo": .IndexColumn1() = "OhrVtmCode": .IndexColumn2() = "OhrVchNo"
'.AddIndex: .IndexName() = "OhrDate": .IndexColumn1() = "OhrDate"
'.AddIndex: .IndexName() = "OhrPttCode": .IndexColumn1() = "OhrPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdRcpt"
'Rem field definitions
'.AddColumn: .ColumnName() = "OrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "OrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "OrcICode"
'Rem index definition
'.AddIndex: .IndexName() = "OrcCodeICode": .IndexColumn1() = "OrcCode": .IndexColumn2() = "OrcICode"
'.AddIndex: .IndexName() = "OrcCodeSNo": .IndexColumn1() = "OrcCode": .IndexColumn2() = "OrcSno"
'.AddIndex: .IndexName() = "OrcDate": .IndexColumn1() = "OrcDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdRcpt_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "OrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrcCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "OrcICode"
'Rem index definition
'.AddIndex: .IndexName() = "OrcICode": .IndexColumn1() = "OrcICode": .IndexUnique() = True
'.AddIndex: .IndexName() = "OrcCodeICode": .IndexColumn1() = "OrcCode": .IndexColumn2() = "OrcICode"
'.AddIndex: .IndexName() = "OrcCodeSNo": .IndexColumn1() = "OrcCode": .IndexColumn2() = "OrcSno"
'.AddIndex: .IndexName() = "OrcDate": .IndexColumn1() = "OrcDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdRcDctDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "OrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdOrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "OrdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "OrdICode"
'Rem index definition
'.AddIndex: .IndexName() = "OrdTranCode": .IndexColumn1() = "OrdCode": .IndexColumn2() = "OrdOrcCode": .IndexColumn3() = "OrdICode"
'.AddIndex: .IndexName() = "OrdShowCode": .IndexColumn1() = "OrdCode": .IndexColumn2() = "OrdOrcCode": .IndexColumn3() = "OrdSno"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdRcDctDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "OrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdOrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OrdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "OrdICode"
'Rem index definition
'.AddIndex: .IndexName() = "OrdICode": .IndexUnique() = True: .IndexColumn1() = "OrdICode"
'.AddIndex: .IndexName() = "OrdTranCode": .IndexColumn1() = "OrdCode": .IndexColumn2() = "OrdOrcCode": .IndexColumn3() = "OrdICode"
'.AddIndex: .IndexName() = "OrdShowCode": .IndexColumn1() = "OrdCode": .IndexColumn2() = "OrdOrcCode": .IndexColumn3() = "OrdSno"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdPymtHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "OphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "OphOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphOldOphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "OphCode"
'Rem index definition
'.AddIndex: .IndexName() = "OphVtmCodeVchNo": .IndexColumn1() = "OphVtmCode": .IndexColumn2() = "OphVchNo"
'.AddIndex: .IndexName() = "OphDate": .IndexColumn1() = "OphDate"
'.AddIndex: .IndexName() = "OphPttCode": .IndexColumn1() = "OphPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdPymtHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "OphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphOldOphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "OphCode"
'Rem index definition
'.AddIndex: .IndexName() = "OphCode": .IndexUnique() = True: .IndexColumn1() = "OphCode"
'.AddIndex: .IndexName() = "OphVtmCodeVchNo": .IndexColumn1() = "OphVtmCode": .IndexColumn2() = "OphVchNo"
'.AddIndex: .IndexName() = "OphDate": .IndexColumn1() = "OphDate"
'.AddIndex: .IndexName() = "OphPttCode": .IndexColumn1() = "OphPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdPymtDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "OpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "OpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpyOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "OpyICode"
'Rem index definition
'.AddIndex: .IndexName() = "OpyCodeICode": .IndexColumn1() = "OpyCode": .IndexColumn2() = "OpyICode"
'.AddIndex: .IndexName() = "OpyCodeSNo": .IndexColumn1() = "OpyCode": .IndexColumn2() = "OpySno"
'.AddIndex: .IndexName() = "OpyDate": .IndexColumn1() = "OpyDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdPymtDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "OpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpyOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "OpyICode"
'Rem index definition
'.AddIndex: .IndexName() = "OpyICode": .IndexUnique() = True: .IndexColumn1() = "OpyICode"
'.AddIndex: .IndexName() = "OpyCodeICode": .IndexColumn1() = "OpyCode": .IndexColumn2() = "OpyICode"
'.AddIndex: .IndexName() = "OpyCodeSNo": .IndexColumn1() = "OpyCode": .IndexColumn2() = "OpySno"
'.AddIndex: .IndexName() = "OpyDate": .IndexColumn1() = "OpyDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdRefdHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "OfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "OfhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhOldOfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "OfhCode"
'Rem index definition
'.AddIndex: .IndexName() = "OfhVtmCodeVchNo": .IndexColumn1() = "OfhVtmCode": .IndexColumn2() = "OfhVchNo"
'.AddIndex: .IndexName() = "OfhDate": .IndexColumn1() = "OfhDate"
'.AddIndex: .IndexName() = "OfhPttCode": .IndexColumn1() = "OfhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdRefdHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "OfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhOldOfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "OfhCode"
'Rem index definition
'.AddIndex: .IndexName() = "OfhCode": .IndexUnique() = True: .IndexColumn1() = "OfhCode"
'.AddIndex: .IndexName() = "OfhVtmCodeVchNo": .IndexColumn1() = "OfhVtmCode": .IndexColumn2() = "OfhVchNo"
'.AddIndex: .IndexName() = "OfhDate": .IndexColumn1() = "OfhDate"
'.AddIndex: .IndexName() = "OfhPttCode": .IndexColumn1() = "OfhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdRefdDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "OfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "OfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "OfdICode"
'Rem index definition
'.AddIndex: .IndexName() = "OfdCodeICode": .IndexColumn1() = "OfdCode": .IndexColumn2() = "OfdICode"
'.AddIndex: .IndexName() = "OfdCodeSNo": .IndexColumn1() = "OfdCode": .IndexColumn2() = "OfdSno"
'.AddIndex: .IndexName() = "OfdDate": .IndexColumn1() = "OfdDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdRefdDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "OfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdOhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "OfdICode"
'Rem index definition
'.AddIndex: .IndexName() = "OfdICode": .IndexUnique() = True: .IndexColumn1() = "OfdICode"
'.AddIndex: .IndexName() = "OfdCodeICode": .IndexColumn1() = "OfdCode": .IndexColumn2() = "OfdICode"
'.AddIndex: .IndexName() = "OfdCodeSNo": .IndexColumn1() = "OfdCode": .IndexColumn2() = "OfdSno"
'.AddIndex: .IndexName() = "OfdDate": .IndexColumn1() = "OfdDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'' -------------------------------------- outdoor bill section -----------------------------------------
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "ObhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhOldObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "ObhCode"
'Rem index definition
'.AddIndex: .IndexName() = "ObhVtmCodeVchNo": .IndexColumn1() = "ObhVtmCode": .IndexColumn2() = "ObhVchNo"
'.AddIndex: .IndexName() = "ObhDate": .IndexColumn1() = "ObhDate"
'.AddIndex: .IndexName() = "ObhPttCode": .IndexColumn1() = "ObhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhOldObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "ObhCode"
'Rem index definition
'.AddIndex: .IndexName() = "ObhCode": .IndexUnique() = True: .IndexColumn1() = "ObhCode"
'.AddIndex: .IndexName() = "ObhVtmCodeVchNo": .IndexColumn1() = "ObhVtmCode": .IndexColumn2() = "ObhVchNo"
'.AddIndex: .IndexName() = "ObhDate": .IndexColumn1() = "ObhDate"
'.AddIndex: .IndexName() = "ObhPttCode": .IndexColumn1() = "ObhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBill"
'Rem field definitions
'.AddColumn: .ColumnName() = "OblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "OblSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "OblICode"
'Rem index definition
'.AddIndex: .IndexName() = "OblCodeICode": .IndexColumn1() = "OblCode": .IndexColumn2() = "OblICode"
'.AddIndex: .IndexName() = "OblCodeSNo": .IndexColumn1() = "OblCode": .IndexColumn2() = "OblSno"
'.AddIndex: .IndexName() = "OblDate": .IndexColumn1() = "OblDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBill_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "OblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "OblRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "OblCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "OblICode"
'Rem index definition
'.AddIndex: .IndexName() = "OblICode": .IndexUnique() = True: .IndexColumn1() = "OblICode"
'.AddIndex: .IndexName() = "OblCodeICode": .IndexColumn1() = "OblCode": .IndexColumn2() = "OblICode"
'.AddIndex: .IndexName() = "OblCodeSNo": .IndexColumn1() = "OblCode": .IndexColumn2() = "OblSno"
'.AddIndex: .IndexName() = "OblDate": .IndexColumn1() = "OblDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlDctDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdOblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "ObdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "ObdICode"
'Rem index definition
'.AddIndex: .IndexName() = "ObdTranCode": .IndexColumn1() = "ObdCode": .IndexColumn2() = "ObdOblCode": .IndexColumn3() = "ObdICode"
'.AddIndex: .IndexName() = "ObdShowCode": .IndexColumn1() = "ObdCode": .IndexColumn2() = "ObdOblCode": .IndexColumn3() = "ObdSno"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlDctDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdOblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "ObdICode"
'Rem index definition
'.AddIndex: .IndexName() = "ObdICode": .IndexUnique() = True: .IndexColumn1() = "ObdICode"
'.AddIndex: .IndexName() = "ObdTranCode": .IndexColumn1() = "ObdCode": .IndexColumn2() = "ObdOblCode": .IndexColumn3() = "ObdICode"
'.AddIndex: .IndexName() = "ObdShowCode": .IndexColumn1() = "ObdCode": .IndexColumn2() = "ObdOblCode": .IndexColumn3() = "ObdSno"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlPymtHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "ObphOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphOldObphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "ObphCode"
'Rem index definition
'.AddIndex: .IndexName() = "ObphVtmCodeVchNo": .IndexColumn1() = "ObphVtmCode": .IndexColumn2() = "ObphVchNo"
'.AddIndex: .IndexName() = "ObphDate": .IndexColumn1() = "ObphDate"
'.AddIndex: .IndexName() = "ObphPttCode": .IndexColumn1() = "ObphPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlPymtHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphOldObphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "ObphCode"
'Rem index definition
'.AddIndex: .IndexName() = "ObphCode": .IndexUnique() = True: .IndexColumn1() = "ObphCode"
'.AddIndex: .IndexName() = "ObphVtmCodeVchNo": .IndexColumn1() = "ObphVtmCode": .IndexColumn2() = "ObphVchNo"
'.AddIndex: .IndexName() = "ObphDate": .IndexColumn1() = "ObphDate"
'.AddIndex: .IndexName() = "ObphPttCode": .IndexColumn1() = "ObphPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlPymtDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "ObpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpyObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "ObpyICode"
'Rem index definition
'.AddIndex: .IndexName() = "ObpyCodeICode": .IndexColumn1() = "ObpyCode": .IndexColumn2() = "ObpyICode"
'.AddIndex: .IndexName() = "ObpyCodeSNo": .IndexColumn1() = "ObpyCode": .IndexColumn2() = "ObpySno"
'.AddIndex: .IndexName() = "ObpyDate": .IndexColumn1() = "ObpyDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlPymtDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpyObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "ObpyICode"
'Rem index definition
'.AddIndex: .IndexName() = "ObpyICode": .IndexUnique() = True: .IndexColumn1() = "ObpyICode"
'.AddIndex: .IndexName() = "ObpyCodeICode": .IndexColumn1() = "ObpyCode": .IndexColumn2() = "ObpyICode"
'.AddIndex: .IndexName() = "ObpyCodeSNo": .IndexColumn1() = "ObpyCode": .IndexColumn2() = "ObpySno"
'.AddIndex: .IndexName() = "ObpyDate": .IndexColumn1() = "ObpyDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlRefdHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "ObfhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhOldObfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "ObfhCode"
'Rem index definition
'.AddIndex: .IndexName() = "ObfhVtmCodeVchNo": .IndexColumn1() = "ObfhVtmCode": .IndexColumn2() = "ObfhVchNo"
'.AddIndex: .IndexName() = "ObfhDate": .IndexColumn1() = "ObfhDate"
'.AddIndex: .IndexName() = "ObfhPttCode": .IndexColumn1() = "ObfhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlRefdHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhOpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhOldObfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "ObfhCode"
'Rem index definition
'.AddIndex: .IndexName() = "ObfhCode": .IndexUnique() = True: .IndexColumn1() = "ObfhCode"
'.AddIndex: .IndexName() = "ObfhVtmCodeVchNo": .IndexColumn1() = "ObfhVtmCode": .IndexColumn2() = "ObfhVchNo"
'.AddIndex: .IndexName() = "ObfhDate": .IndexColumn1() = "ObfhDate"
'.AddIndex: .IndexName() = "ObfhPttCode": .IndexColumn1() = "ObfhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlRefdDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "ObfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "ObfdICode"
'Rem index definition
'.AddIndex: .IndexName() = "ObfdCodeICode": .IndexColumn1() = "ObfdCode": .IndexColumn2() = "ObfdICode"
'.AddIndex: .IndexName() = "ObfdCodeSNo": .IndexColumn1() = "ObfdCode": .IndexColumn2() = "ObfdSno"
'.AddIndex: .IndexName() = "ObfdDate": .IndexColumn1() = "ObfdDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "OutdBlRefdDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "ObfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdObhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "ObfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "ObfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "ObfdICode"
'Rem index definition
'.AddIndex: .IndexName() = "ObfdICode": .IndexUnique() = True: .IndexColumn1() = "ObfdICode"
'.AddIndex: .IndexName() = "ObfdCodeICode": .IndexColumn1() = "ObfdCode": .IndexColumn2() = "ObfdICode"
'.AddIndex: .IndexName() = "ObfdCodeSNo": .IndexColumn1() = "ObfdCode": .IndexColumn2() = "ObfdSno"
'.AddIndex: .IndexName() = "ObfdDate": .IndexColumn1() = "ObfdDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'
'
'
'
'
'
'
'Rem InfoBox dbBdkCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"
'
'CloseDataSource dbBdkDatabase
'
'EndSub:
'Set dbBdkCatalog = Nothing
'Set dbBdkDatabase = Nothing
'Set clsDB = Nothing
'Exit Sub
'
'End Sub
'
'Public Sub CreateBdkIpdTranDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
'Dim mTableStru As adTableStru, dbBdkDatabase As New ADODB.Connection, dbBdkCatalog As New ADOX.Catalog, clsDB As clsDataStru
'
'If mAddMode = True Then
'    If Dir(dbBdkDatabaseFullPath) = "" Then
'        dbBdkCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbBdkDatabaseFullPath
'        Set dbBdkCatalog = Nothing
'    Else
'        ErrorBox "Database " & dbBdkDatabaseFullPath & " already exist !!!"
'        GoTo EndSub
'    End If
'End If
'
'OpenBdkDataSource dbBdkDatabase, mExclusiveMode:=True
'If dbBdkDatabase.State <> 1 Then
'    ErrorBox Err.Description
'    GoTo EndSub
'End If
'Set dbBdkCatalog.ActiveConnection = dbBdkDatabase
'Set clsDB = New clsDataStru
'If Not FormProgStatus Is Nothing Then
'    If FormProgStatus.Visible = True Then
'        Set clsDB.FormProgStatus = FormProgStatus
'        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 44
'    End If
'End If
'
'Rem ------------------------------- indoor tables part first -------------------------------------------------------------
'
'CreateBdkIpdRegDatabase dbBdkCatalog, clsDB
'
'' ------------------------------------------------- indoor receipt section ---------------------------------
'With clsDB
'.ClearTableStru
'.TableName = "IndrHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "IhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IhrIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrOldIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IhrCode"
'Rem index definition
'.AddIndex: .IndexName() = "IhrVtmCodeVchNo": .IndexColumn1() = "IhrVtmCode": .IndexColumn2() = "IhrVchNo"
'.AddIndex: .IndexName() = "IhrDate": .IndexColumn1() = "IhrDate"
'.AddIndex: .IndexName() = "IhrPttCode": .IndexColumn1() = "IhrPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrOldIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IhrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IhrCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IhrCode"
'Rem index definition
'.AddIndex: .IndexName() = "IhrCode": .IndexColumn1() = "IhrCode": .IndexUnique() = True
'.AddIndex: .IndexName() = "IhrVtmCodeVchNo": .IndexColumn1() = "IhrVtmCode": .IndexColumn2() = "IhrVchNo"
'.AddIndex: .IndexName() = "IhrDate": .IndexColumn1() = "IhrDate"
'.AddIndex: .IndexName() = "IhrPttCode": .IndexColumn1() = "IhrPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRcpt"
'Rem field definitions
'.AddColumn: .ColumnName() = "IrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IrcICode"
'Rem index definition
'.AddIndex: .IndexName() = "IrcCodeICode": .IndexColumn1() = "IrcCode": .IndexColumn2() = "IrcICode"
'.AddIndex: .IndexName() = "IrcCodeSNo": .IndexColumn1() = "IrcCode": .IndexColumn2() = "IrcSno"
'.AddIndex: .IndexName() = "IrcDate": .IndexColumn1() = "IrcDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRcpt_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcRecdAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrcRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrcCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IrcICode"
'Rem index definition
'.AddIndex: .IndexName() = "IrcICode": .IndexColumn1() = "IrcICode": .IndexUnique() = True
'.AddIndex: .IndexName() = "IrcCodeICode": .IndexColumn1() = "IrcCode": .IndexColumn2() = "IrcICode"
'.AddIndex: .IndexName() = "IrcCodeSNo": .IndexColumn1() = "IrcCode": .IndexColumn2() = "IrcSno"
'.AddIndex: .IndexName() = "IrcDate": .IndexColumn1() = "IrcDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRcDctDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "IrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdIrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IrdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IrdICode"
'Rem index definition
'.AddIndex: .IndexName() = "IrdTranCode": .IndexColumn1() = "IrdCode": .IndexColumn2() = "IrdIrcCode": .IndexColumn3() = "IrdICode"
'.AddIndex: .IndexName() = "IrdShowCode": .IndexColumn1() = "IrdCode": .IndexColumn2() = "IrdIrcCode": .IndexColumn3() = "IrdSno"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRcDctDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IrdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdIrcCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IrdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IrdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IrdICode"
'Rem index definition
'.AddIndex: .IndexName() = "IrdICode": .IndexUnique() = True: .IndexColumn1() = "IrdICode"
'.AddIndex: .IndexName() = "IrdTranCode": .IndexColumn1() = "IrdCode": .IndexColumn2() = "IrdIrcCode": .IndexColumn3() = "IrdICode"
'.AddIndex: .IndexName() = "IrdShowCode": .IndexColumn1() = "IrdCode": .IndexColumn2() = "IrdIrcCode": .IndexColumn3() = "IrdSno"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrPymtHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "IphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IphIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphOldIphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IphCode"
'Rem index definition
'.AddIndex: .IndexName() = "IphVtmCodeVchNo": .IndexColumn1() = "IphVtmCode": .IndexColumn2() = "IphVchNo"
'.AddIndex: .IndexName() = "IphDate": .IndexColumn1() = "IphDate"
'.AddIndex: .IndexName() = "IphPttCode": .IndexColumn1() = "IphPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrPymtHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphOldIphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IphCode"
'Rem index definition
'.AddIndex: .IndexName() = "IphCode": .IndexUnique() = True: .IndexColumn1() = "IphCode"
'.AddIndex: .IndexName() = "IphVtmCodeVchNo": .IndexColumn1() = "IphVtmCode": .IndexColumn2() = "IphVchNo"
'.AddIndex: .IndexName() = "IphDate": .IndexColumn1() = "IphDate"
'.AddIndex: .IndexName() = "IphPttCode": .IndexColumn1() = "IphPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrPymtDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "IpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpyIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IpyICode"
'Rem index definition
'.AddIndex: .IndexName() = "IpyCodeICode": .IndexColumn1() = "IpyCode": .IndexColumn2() = "IpyICode"
'.AddIndex: .IndexName() = "IpyCodeSNo": .IndexColumn1() = "IpyCode": .IndexColumn2() = "IpySno"
'.AddIndex: .IndexName() = "IpyDate": .IndexColumn1() = "IpyDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrPymtDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpyIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IpyICode"
'Rem index definition
'.AddIndex: .IndexName() = "IpyICode": .IndexUnique() = True: .IndexColumn1() = "IpyICode"
'.AddIndex: .IndexName() = "IpyCodeICode": .IndexColumn1() = "IpyCode": .IndexColumn2() = "IpyICode"
'.AddIndex: .IndexName() = "IpyCodeSNo": .IndexColumn1() = "IpyCode": .IndexColumn2() = "IpySno"
'.AddIndex: .IndexName() = "IpyDate": .IndexColumn1() = "IpyDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRefdHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "IfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IfhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhOldIfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IfhCode"
'Rem index definition
'.AddIndex: .IndexName() = "IfhVtmCodeVchNo": .IndexColumn1() = "IfhVtmCode": .IndexColumn2() = "IfhVchNo"
'.AddIndex: .IndexName() = "IfhDate": .IndexColumn1() = "IfhDate"
'.AddIndex: .IndexName() = "IfhPttCode": .IndexColumn1() = "IfhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRefdHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhOldIfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IfhCode"
'Rem index definition
'.AddIndex: .IndexName() = "IfhCode": .IndexUnique() = True: .IndexColumn1() = "IfhCode"
'.AddIndex: .IndexName() = "IfhVtmCodeVchNo": .IndexColumn1() = "IfhVtmCode": .IndexColumn2() = "IfhVchNo"
'.AddIndex: .IndexName() = "IfhDate": .IndexColumn1() = "IfhDate"
'.AddIndex: .IndexName() = "IfhPttCode": .IndexColumn1() = "IfhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRefdDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "IfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IfdICode"
'Rem index definition
'.AddIndex: .IndexName() = "IfdCodeICode": .IndexColumn1() = "IfdCode": .IndexColumn2() = "IfdICode"
'.AddIndex: .IndexName() = "IfdCodeSNo": .IndexColumn1() = "IfdCode": .IndexColumn2() = "IfdSno"
'.AddIndex: .IndexName() = "IfdDate": .IndexColumn1() = "IfdDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRefdDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdIhrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IfdICode"
'Rem index definition
'.AddIndex: .IndexName() = "IfdICode": .IndexUnique() = True: .IndexColumn1() = "IfdICode"
'.AddIndex: .IndexName() = "IfdCodeICode": .IndexColumn1() = "IfdCode": .IndexColumn2() = "IfdICode"
'.AddIndex: .IndexName() = "IfdCodeSNo": .IndexColumn1() = "IfdCode": .IndexColumn2() = "IfdSno"
'.AddIndex: .IndexName() = "IfdDate": .IndexColumn1() = "IfdDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'' ----------------------------------- indoor bill section --------------------------------------------------
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhOldIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IbhCode"
'Rem index definition
'.AddIndex: .IndexName() = "IbhVtmCodeVchNo": .IndexColumn1() = "IbhVtmCode": .IndexColumn2() = "IbhVchNo"
'.AddIndex: .IndexName() = "IbhDate": .IndexColumn1() = "IbhDate"
'.AddIndex: .IndexName() = "IbhPttCode": .IndexColumn1() = "IbhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhOldIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhPttDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IbhCode"
'Rem index definition
'.AddIndex: .IndexName() = "IbhCode": .IndexColumn1() = "IbhCode": .IndexUnique() = True
'.AddIndex: .IndexName() = "IbhVtmCodeVchNo": .IndexColumn1() = "IbhVtmCode": .IndexColumn2() = "IbhVchNo"
'.AddIndex: .IndexName() = "IbhDate": .IndexColumn1() = "IbhDate"
'.AddIndex: .IndexName() = "IbhPttCode": .IndexColumn1() = "IbhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBill"
'Rem field definitions
'.AddColumn: .ColumnName() = "IblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IblSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IblICode"
'Rem index definition
'.AddIndex: .IndexName() = "IblCodeICode": .IndexColumn1() = "IblCode": .IndexColumn2() = "IblICode"
'.AddIndex: .IndexName() = "IblCodeSNo": .IndexColumn1() = "IblCode": .IndexColumn2() = "IblSno"
'.AddIndex: .IndexName() = "IblDate": .IndexColumn1() = "IblDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBill_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblUnit": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblAmtBefDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblAmtAftDisc": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IblRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IblCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IblICode"
'Rem index definition
'.AddIndex: .IndexName() = "IblICode": .IndexColumn1() = "IblICode": .IndexUnique() = True
'.AddIndex: .IndexName() = "IblCodeICode": .IndexColumn1() = "IblCode": .IndexColumn2() = "IblICode"
'.AddIndex: .IndexName() = "IblCodeSNo": .IndexColumn1() = "IblCode": .IndexColumn2() = "IblSno"
'.AddIndex: .IndexName() = "IblDate": .IndexColumn1() = "IblDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlIbsDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsIblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbbsIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsFromDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsFromTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsToDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsToTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsUnit": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbbsCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IbbsICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbbsTrnCode": .IndexColumn1() = "IbbsCode": .IndexColumn2() = "IbbsIblICode": .IndexColumn3() = "IbbsICode"
'.AddIndex: .IndexName() = "IbbsIbsCode": .IndexColumn1() = "IbbsIbsCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlIbsDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsIblICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsFromDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsFromTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsToDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsToTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsUnit": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbbsCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbbsRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IbbsICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbbsICode": .IndexUnique() = True: .IndexColumn1() = "IbbsICode"
'.AddIndex: .IndexName() = "IbbsTrnCode": .IndexColumn1() = "IbbsCode": .IndexColumn2() = "IbbsIblICode": .IndexColumn3() = "IbbsICode"
'.AddIndex: .IndexName() = "IbbsIbsCode": .IndexColumn1() = "IbbsIbsCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlDctDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdIblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IbdICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbdTranCode": .IndexColumn1() = "IbdCode": .IndexColumn2() = "IbdIblCode": .IndexColumn3() = "IbdICode"
'.AddIndex: .IndexName() = "IbdShowCode": .IndexColumn1() = "IbdCode": .IndexColumn2() = "IbdIblCode": .IndexColumn3() = "IbdSno"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlDctDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdIblCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdSrvCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbdDrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IbdICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbdICode": .IndexUnique() = True: .IndexColumn1() = "IbdICode"
'.AddIndex: .IndexName() = "IbdTranCode": .IndexColumn1() = "IbdCode": .IndexColumn2() = "IbdIblCode": .IndexColumn3() = "IbdICode"
'.AddIndex: .IndexName() = "IbdShowCode": .IndexColumn1() = "IbdCode": .IndexColumn2() = "IbdIblCode": .IndexColumn3() = "IbdSno"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlDpogDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbgdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbgdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgdIgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgdDpogAmt": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbgdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IbgdICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbgdCodeICode": .IndexColumn1() = "IbgdCode": .IndexColumn2() = "IbgdICode"
'.AddIndex: .IndexName() = "IbgdCodeSno": .IndexColumn1() = "IbgdCode": .IndexColumn2() = "IbgdSno"
'.AddIndex: .IndexName() = "IbgdIgtCode": .IndexColumn1() = "IbgdIgtCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlDpogDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbgdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbgdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgdIgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgdDpogAmt": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbgdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IbgdICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbgdICode": .IndexUnique() = True: .IndexColumn1() = "IbgdICode"
'.AddIndex: .IndexName() = "IbgdCodeICode": .IndexColumn1() = "IbgdCode": .IndexColumn2() = "IbgdICode"
'.AddIndex: .IndexName() = "IbgdCodeSno": .IndexColumn1() = "IbgdCode": .IndexColumn2() = "IbgdSno"
'.AddIndex: .IndexName() = "IbgdIgtCode": .IndexColumn1() = "IbgdIgtCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlRfugDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbgfSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfIgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfRfugAmt": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbgfCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IbgfICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbgfCodeICode": .IndexColumn1() = "IbgfCode": .IndexColumn2() = "IbgfICode"
'.AddIndex: .IndexName() = "IbgfCodeSno": .IndexColumn1() = "IbgfCode": .IndexColumn2() = "IbgfSno"
'.AddIndex: .IndexName() = "IbgfIgfCode": .IndexColumn1() = "IbgfIgfCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlRfugDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfIgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfRfugAmt": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbgfCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbgfRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IbgfICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbgfICode": .IndexUnique() = True: .IndexColumn1() = "IbgfICode"
'.AddIndex: .IndexName() = "IbgfCodeICode": .IndexColumn1() = "IbgfCode": .IndexColumn2() = "IbgfICode"
'.AddIndex: .IndexName() = "IbgfCodeSno": .IndexColumn1() = "IbgfCode": .IndexColumn2() = "IbgfSno"
'.AddIndex: .IndexName() = "IbgfIgfCode": .IndexColumn1() = "IbgfIgfCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlPymtHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbphIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphOldIbphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IbphCode"
'Rem index definition
'.AddIndex: .IndexName() = "IbphVtmCodeVchNo": .IndexColumn1() = "IbphVtmCode": .IndexColumn2() = "IbphVchNo"
'.AddIndex: .IndexName() = "IbphDate": .IndexColumn1() = "IbphDate"
'.AddIndex: .IndexName() = "IbphPttCode": .IndexColumn1() = "IbphPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlPymtHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphOldIbphCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbphRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbphCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IbphCode"
'Rem index definition
'.AddIndex: .IndexName() = "IbphCode": .IndexUnique() = True: .IndexColumn1() = "IbphCode"
'.AddIndex: .IndexName() = "IbphVtmCodeVchNo": .IndexColumn1() = "IbphVtmCode": .IndexColumn2() = "IbphVchNo"
'.AddIndex: .IndexName() = "IbphDate": .IndexColumn1() = "IbphDate"
'.AddIndex: .IndexName() = "IbphPttCode": .IndexColumn1() = "IbphPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlPymtDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpyIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IbpyICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbpyCodeICode": .IndexColumn1() = "IbpyCode": .IndexColumn2() = "IbpyICode"
'.AddIndex: .IndexName() = "IbpyCodeSNo": .IndexColumn1() = "IbpyCode": .IndexColumn2() = "IbpySno"
'.AddIndex: .IndexName() = "IbpyDate": .IndexColumn1() = "IbpyDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlPymtDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbpyCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpyICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpySno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpyDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpyPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpyIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbpyDepoAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbpyRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbpyRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbpyCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IbpyICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbpyICode": .IndexUnique() = True: .IndexColumn1() = "IbpyICode"
'.AddIndex: .IndexName() = "IbpyCodeICode": .IndexColumn1() = "IbpyCode": .IndexColumn2() = "IbpyICode"
'.AddIndex: .IndexName() = "IbpyCodeSNo": .IndexColumn1() = "IbpyCode": .IndexColumn2() = "IbpySno"
'.AddIndex: .IndexName() = "IbpyDate": .IndexColumn1() = "IbpyDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlRefdHdr"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbfhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhOldIbfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IbfhCode"
'Rem index definition
'.AddIndex: .IndexName() = "IbfhVtmCodeVchNo": .IndexColumn1() = "IbfhVtmCode": .IndexColumn2() = "IbfhVchNo"
'.AddIndex: .IndexName() = "IbfhDate": .IndexColumn1() = "IbfhDate"
'.AddIndex: .IndexName() = "IbfhPttCode": .IndexColumn1() = "IbfhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlRefdHdr_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhOldIbfhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfhRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfhCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IbfhCode"
'Rem index definition
'.AddIndex: .IndexName() = "IbfhCode": .IndexUnique() = True: .IndexColumn1() = "IbfhCode"
'.AddIndex: .IndexName() = "IbfhVtmCodeVchNo": .IndexColumn1() = "IbfhVtmCode": .IndexColumn2() = "IbfhVchNo"
'.AddIndex: .IndexName() = "IbfhDate": .IndexColumn1() = "IbfhDate"
'.AddIndex: .IndexName() = "IbfhPttCode": .IndexColumn1() = "IbfhPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlRefdDtl"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IbfdICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbfdCodeICode": .IndexColumn1() = "IbfdCode": .IndexColumn2() = "IbfdICode"
'.AddIndex: .IndexName() = "IbfdCodeSNo": .IndexColumn1() = "IbfdCode": .IndexColumn2() = "IbfdSno"
'.AddIndex: .IndexName() = "IbfdDate": .IndexColumn1() = "IbfdDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrBlRefdDtl_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbfdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdIbhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfdRefuAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfdRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbfdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbfdCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IbfdICode"
'Rem index definition
'.AddIndex: .IndexName() = "IbfdICode": .IndexUnique() = True: .IndexColumn1() = "IbfdICode"
'.AddIndex: .IndexName() = "IbfdCodeICode": .IndexColumn1() = "IbfdCode": .IndexColumn2() = "IbfdICode"
'.AddIndex: .IndexName() = "IbfdCodeSNo": .IndexColumn1() = "IbfdCode": .IndexColumn2() = "IbfdSno"
'.AddIndex: .IndexName() = "IbfdDate": .IndexColumn1() = "IbfdDate"
'
'.CreateTable dbBdkCatalog
'End With
'
'
'Rem InfoBox dbBdkCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"
'
'CloseDataSource dbBdkDatabase
'
'EndSub:
'Set dbBdkCatalog = Nothing
'Set dbBdkDatabase = Nothing
'Set clsDB = Nothing
'Exit Sub
'
'End Sub
'
'Private Sub CreateBdkIpdRegDatabase(ByRef dbBdkCatalog As ADOX.Catalog, ByRef clsDB As clsDataStru)
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrReg"
'Rem field definitions
'.AddColumn: .ColumnName() = "IpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IpgVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgOldIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgCDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgPDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgFDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgBdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgDischDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgDischTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IpgCode"
'Rem index definition
'.AddIndex: .IndexName() = "IpgVchNo": .IndexColumn1() = "IpgVchNo"
'.AddIndex: .IndexName() = "IpgDate": .IndexColumn1() = "IpgDate"
'.AddIndex: .IndexName() = "IpgPttCode": .IndexColumn1() = "IpgPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrReg_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgOldIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgCDctCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgRByCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgRToCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgPDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgFDigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgBdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgDischDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgDischTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgAdvAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IpgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IpgCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IpgCode"
'Rem index definition
'.AddIndex: .IndexName() = "IpgCode": .IndexUnique() = True: .IndexColumn1() = "IpgCode"
'.AddIndex: .IndexName() = "IpgVchNo": .IndexColumn1() = "IpgVchNo"
'.AddIndex: .IndexName() = "IpgDate": .IndexColumn1() = "IpgDate"
'.AddIndex: .IndexName() = "IpgPttCode": .IndexColumn1() = "IpgPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IBedState"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IbsSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsBdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsDischDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsDischTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsDischState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsLIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IbsCode"
'Rem index definition
'.AddIndex: .IndexName() = "IbsIpgIbsCode": .IndexColumn1() = "IbsIpgCode": .IndexColumn2() = "IbsCode"
'.AddIndex: .IndexName() = "IbsIpgCodeSNo": .IndexColumn1() = "IbsIpgCode": .IndexColumn2() = "IbsSno"
'.AddIndex: .IndexName() = "IbsVchNo": .IndexColumn1() = "IbsVchNo"
'.AddIndex: .IndexName() = "IbsDate": .IndexColumn1() = "IbsDate"
'.AddIndex: .IndexName() = "IbsPttCode": .IndexColumn1() = "IbsPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IBedState_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsBdmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsDischDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsDischTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsDischState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsLIbsCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IbsRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IbsCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IbsCode"
'Rem index definition
'.AddIndex: .IndexName() = "IbsCode": .IndexUnique() = True: .IndexColumn1() = "IbsCode"
'.AddIndex: .IndexName() = "IbsIpgIbsCode": .IndexColumn1() = "IbsIpgCode": .IndexColumn2() = "IbsCode"
'.AddIndex: .IndexName() = "IbsIpgCodeSNo": .IndexColumn1() = "IbsIpgCode": .IndexColumn2() = "IbsSno"
'.AddIndex: .IndexName() = "IbsVchNo": .IndexColumn1() = "IbsVchNo"
'.AddIndex: .IndexName() = "IbsDate": .IndexColumn1() = "IbsDate"
'.AddIndex: .IndexName() = "IbsPttCode": .IndexColumn1() = "IbsPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRgPymt"
'Rem field definitions
'.AddColumn: .ColumnName() = "IgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IgtIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtOldIgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtAdjAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IgtCode"
'Rem index definition
'.AddIndex: .IndexName() = "IgtVchNo": .IndexColumn1() = "IgtVchNo"
'.AddIndex: .IndexName() = "IgtDate": .IndexColumn1() = "IgtDate"
'.AddIndex: .IndexName() = "IgtPttCode": .IndexColumn1() = "IgtPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRgPymt_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtOldIgtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtDpogAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtAdjAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgtCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgtRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IgtCode"
'Rem index definition
'.AddIndex: .IndexName() = "IgtCode": .IndexUnique() = True: .IndexColumn1() = "IgtCode"
'.AddIndex: .IndexName() = "IgtVchNo": .IndexColumn1() = "IgtVchNo"
'.AddIndex: .IndexName() = "IgtDate": .IndexColumn1() = "IgtDate"
'.AddIndex: .IndexName() = "IgtPttCode": .IndexColumn1() = "IgtPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRgRefd"
'Rem field definitions
'.AddColumn: .ColumnName() = "IgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
'.AddColumn: .ColumnName() = "IgfIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfOldIgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfAdjAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'.PrimaryKey = "IgfCode"
'Rem index definition
'.AddIndex: .IndexName() = "IgfVchNo": .IndexColumn1() = "IgfVchNo"
'.AddIndex: .IndexName() = "IgfDate": .IndexColumn1() = "IgfDate"
'.AddIndex: .IndexName() = "IgfPttCode": .IndexColumn1() = "IgfPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'With clsDB
'.ClearTableStru
'.TableName = "IndrRgRefd_Log"
'Rem field definitions
'.AddColumn: .ColumnName() = "IgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfIpgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfVtmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfPrefix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfVchNo": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfPostfix": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfOldIgfCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfRfugAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfAdjAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfBalAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
'.AddColumn: .ColumnName() = "IgfCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'.AddColumn: .ColumnName() = "IgfRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
'Rem primary key definition
'Rem .PrimaryKey = "IgfCode"
'Rem index definition
'.AddIndex: .IndexName() = "IgfCode": .IndexUnique() = True: .IndexColumn1() = "IgfCode"
'.AddIndex: .IndexName() = "IgfVchNo": .IndexColumn1() = "IgfVchNo"
'.AddIndex: .IndexName() = "IgfDate": .IndexColumn1() = "IgfDate"
'.AddIndex: .IndexName() = "IgfPttCode": .IndexColumn1() = "IgfPttCode"
'
'.CreateTable dbBdkCatalog
'End With
'
'End Sub

Public Sub CreateBdkComDatabase(Optional ByRef FormProgStatus As frmProgressStatus)
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
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 26
    End If
End If

Rem link table *****************************************************************************
With clsDB
.ClearLinkStru
' -----------------------------master tables ----------------------------
.AddLink: .LinkTableName() = "BloodGrpMst": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "BloodCompoMst": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "BloodMast": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "BloodPckMst": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "HospCatgMst": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "HospMast": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "EntityCatgMst": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "EntityMast": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "EFmlyCatgMst": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "EFamilyMast": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "OutdRcDctDtl": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "DoctCatgMst": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "RefCatgMst": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "DoctRoleMst": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "DoctMast": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "RefByMast": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "RefToMast": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "ServGrpMst": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "ServMast": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "DiagMast": .LinkDbSource() = dbBdkDatabaseFullPath


.CreateLink dbComCatalog
End With


With clsDB
.ClearLinkStru
' --------------- transaction tables ----------------------------
.AddLink: .LinkTableName() = "BloodInHdr": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "BloodInDtl": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "BloodOutHdr": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "BloodOutDtl": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "OutdHdr": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "OutdRcpt": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "OutdPymtHdr": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "OutdPymtDtl": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "OutdRefdHdr": .LinkDbSource() = dbBdkDatabaseFullPath
.AddLink: .LinkTableName() = "OutdRefdDtl": .LinkDbSource() = dbBdkDatabaseFullPath

.CreateLink dbComCatalog
End With



With clsDB
.ClearViewStru
.ViewName = "vewOutdRcpt"
.CommandStr = "SELECT OutdRcpt.*, OutdHdr.*, EntityMast.*, EttStsnMast.*, EttAreaMast.*, HospMast.*, HpmStsnMast.*, HpmAreaMast.*, ServMast.*, VTypMast.*, ServGrpMst.*, OutdRcDctDtl.*, ServDoct.*, DoctRoleMst.* " _
    & " FROM ((((((OutdRcpt" _
    & " INNER JOIN OutdHdr ON OutdRcpt.OrcCode = OutdHdr.OhrCode)" _
    & " INNER JOIN VTypMast ON OutdHdr.OhrVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN ServMast ON OutdRcpt.OrcSrvCode = ServMast.SrvCode)" _
    & " INNER JOIN ServGrpMst ON ServMast.SrvSgpCode = ServGrpMst.SgpCode)" _
    & " LEFT JOIN ((OutdRcDctDtl" _
        & " LEFT JOIN DoctMast ServDoct ON OutdRcDctDtl.OrdDctCode=ServDoct.DctCode)" _
        & " LEFT JOIN DoctRoleMst ON OutdRcDctDtl.OrdDrlCode=DoctRoleMst.DrlCode)" _
        & " ON OutdRcpt.OrcICode=OutdRcDctDtl.OrdOrcCode)" _
    & " INNER JOIN ((EntityMast" _
        & " INNER JOIN AreaMast EttAreaMast ON EntityMast.EttAraCode = EttAreaMast.AraCode)" _
        & " INNER JOIN StsnMast EttStsnMast ON EntityMast.EttStnCode = EttStsnMast.StnCode)" _
        & " ON OutdHdr.OhrEttCode = EntityMast.EttCode)" _
    & " INNER JOIN ((HospMast" _
        & " INNER JOIN AreaMast HpmAreaMast ON HospMast.HpmAraCode = HpmAreaMast.AraCode)" _
        & " INNER JOIN StsnMast HpmStsnMast ON HospMast.HpmStnCode = HpmStsnMast.StnCode)" _
        & " ON OutdHdr.OhrHpmCode = HospMast.HpmCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewBloodIn"
.CommandStr = "SELECT BloodInDtl.*,BloodInHdr.*,VTypMast.*,EntityMast.*,EttStsnMast.*,EttAreaMast.*,EFamilyMast.*,EfmStsnMast.*,EfmAreaMast.*,BloodMast.*,BloodGrpMst.*,BloodCompoMst.* " _
    & " FROM ((((((BloodInDtl" _
    & " INNER JOIN BloodInHdr ON BloodInDtl.BinCode = BloodInHdr.BihCode)" _
    & " INNER JOIN VTypMast ON BloodInHdr.BihVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN BloodMast ON BloodInDtl.BinBldCode = BloodMast.BldCode)" _
    & " INNER JOIN BloodGrpMst ON BloodInDtl.BinBdgCode = BloodGrpMst.BdgCode)" _
    & " INNER JOIN BloodCompoMst ON BloodInDtl.BinBdcCode = BloodCompoMst.BdcCode)" _
    & " INNER JOIN ((EntityMast" _
        & " INNER JOIN AreaMast EttAreaMast ON EntityMast.EttAraCode = EttAreaMast.AraCode)" _
        & " INNER JOIN StsnMast EttStsnMast ON EntityMast.EttStnCode = EttStsnMast.StnCode)" _
        & " ON BloodInHdr.BihEttCode = EntityMast.EttCode)" _
    & " INNER JOIN ((EFamilyMast" _
        & " INNER JOIN AreaMast EfmAreaMast ON EFamilyMast.EfmAraCode = EfmAreaMast.AraCode)" _
        & " INNER JOIN StsnMast EfmStsnMast ON EFamilyMast.EfmStnCode = EfmStsnMast.StnCode)" _
        & " ON BloodInHdr.BihEfmCode = EFamilyMast.EfmCode"

.CreateView dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewBloodOut"
.CommandStr = "SELECT BloodOutDtl.*,BloodOutHdr.*,VTypMast.*,EntityMast.*,EttStsnMast.*,EttAreaMast.*,HospMast.*,HpmStsnMast.*,HpmAreaMast.*,BloodMast.*,BloodGrpMst.*,BloodCompoMst.* " _
    & " FROM ((((((BloodOutDtl" _
    & " INNER JOIN BloodOutHdr ON BloodOutDtl.BouCode = BloodOutHdr.BohCode)" _
    & " INNER JOIN VTypMast ON BloodOutHdr.BohVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN BloodMast ON BloodOutDtl.BouBldCode = BloodMast.BldCode)" _
    & " INNER JOIN BloodGrpMst ON BloodOutDtl.BouBdgCode = BloodGrpMst.BdgCode)" _
    & " INNER JOIN BloodCompoMst ON BloodOutDtl.BouBdcCode = BloodCompoMst.BdcCode)" _
    & " INNER JOIN ((EntityMast" _
        & " INNER JOIN AreaMast EttAreaMast ON EntityMast.EttAraCode = EttAreaMast.AraCode)" _
        & " INNER JOIN StsnMast EttStsnMast ON EntityMast.EttStnCode = EttStsnMast.StnCode)" _
        & " ON BloodOutHdr.BohEttCode = EntityMast.EttCode)" _
    & " INNER JOIN ((HospMast" _
        & " INNER JOIN AreaMast HpmAreaMast ON HospMast.HpmAraCode = HpmAreaMast.AraCode)" _
        & " INNER JOIN StsnMast HpmStsnMast ON HospMast.HpmStnCode = HpmStsnMast.StnCode)" _
        & " ON BloodOutHdr.BohHpmCode = HospMast.HpmCode"

.CreateView dbComCatalog
End With











'''With clsDB
'''.ClearViewStru
'''.ViewName = "vewOutdPymt"
'''.CommandStr = "SELECT OutdPymtDtl.*, OutdPymtHdr.*, OutdHdr.*, OhrVTypMast.*, OutdReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
'''    & " FROM ((((OutdPymtDtl" _
'''    & " INNER JOIN OutdPymtHdr ON OutdPymtDtl.OpyCode = OutdPymtHdr.OphCode)" _
'''    & " INNER JOIN (OutdHdr INNER JOIN VTypMast as OhrVTypMast on OutdHdr.OhrVtmCode = OhrVTypMast.VtmCode) ON OutdPymtDtl.OpyOhrCode = OutdHdr.OhrCode)" _
'''    & " INNER JOIN ((OutdReg" _
'''        & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
'''        & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
'''        & " ON OutdPymtHdr.OphOpgCode = OutdReg.OpgCode)" _
'''    & " INNER JOIN VTypMast ON OutdPymtHdr.OphVtmCode = VTypMast.VtmCode)" _
'''    & " INNER JOIN ((PatMast" _
'''        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'''        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'''        & " ON OutdPymtHdr.OphPttCode = PatMast.PttCode"
'''
'''.CreateView dbComCatalog
'''End With
'''
'''With clsDB
'''.ClearViewStru
'''.ViewName = "vewOutdRefd"
'''.CommandStr = "SELECT OutdRefdDtl.*, OutdRefdHdr.*, OutdHdr.*, OhrVTypMast.*, OutdReg.*, DoctMast.*, RefByMast.*, PatMast.*, StsnMast.*, AreaMast.*, VTypMast.* " _
'''    & " FROM ((((OutdRefdDtl" _
'''    & " INNER JOIN OutdRefdHdr ON OutdRefdDtl.OfdCode = OutdRefdHdr.OfhCode)" _
'''    & " INNER JOIN (OutdHdr INNER JOIN VTypMast as OhrVTypMast on OutdHdr.OhrVtmCode = OhrVTypMast.VtmCode) ON OutdRefdDtl.OfdOhrCode = OutdHdr.OhrCode)" _
'''    & " INNER JOIN ((OutdReg" _
'''        & " INNER JOIN DoctMast ON OutdReg.OpgCDctCode = DoctMast.DctCode)" _
'''        & " LEFT JOIN RefByMast ON OutdReg.OpgRByCode = RefByMast.RByCode)" _
'''        & " ON OutdRefdHdr.OfhOpgCode = OutdReg.OpgCode)" _
'''    & " INNER JOIN VTypMast ON OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode)" _
'''    & " INNER JOIN ((PatMast" _
'''        & " INNER JOIN AreaMast ON PatMast.PttAraCode = AreaMast.AraCode)" _
'''        & " INNER JOIN StsnMast ON PatMast.PttStnCode = StsnMast.StnCode)" _
'''        & " ON OutdRefdHdr.OfhPttCode = PatMast.PttCode"
'''
'''.CreateView dbComCatalog
'''End With











Rem InfoBox dbComCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbComDatabase

EndSub:
Set dbComCatalog = Nothing
Set dbComDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Rem ************************************* END OF CLASS *********************************************

