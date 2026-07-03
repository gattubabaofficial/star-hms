Attribute VB_Name = "KgtDataStru"

Option Explicit

Public Sub CreateKgtCmpDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
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
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 7
    End If
End If

With clsDB
.ClearTableStru
.TableName = "Company"
Rem field definitions
.AddColumn: .ColumnName() = "CmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "CmpName": .ColumnType() = adVarWChar: .ColumnWidth() = 100: .ColumnRequired() = True: .AllowZeroLength() = False
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
.AddColumn: .ColumnName() = "CmpSecPwd": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "CmpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "CmpCode"
Rem index definition
.AddIndex: .IndexName() = "CmpName": .IndexColumn1() = "CmpName"

.CreateTable dbCmpCatalog
End With

With clsDB
.ClearTableStru
.TableName = "UserRoleMst"
Rem field definitions
.AddColumn: .ColumnName() = "UrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "UrlName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UrlPwd": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UrlRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "UrlCode"
Rem index definition
.AddIndex: .IndexName() = "UrlName": .IndexUnique() = True: .IndexColumn1() = "UrlName"

.CreateTable dbCmpCatalog
End With

With clsDB
.ClearTableStru
.TableName = "UserRoleMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "UrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UrlName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UrlPwd": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UrlRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "UrlCode"
Rem index definition
.AddIndex: .IndexName() = "UrlCode": .IndexUnique() = True: .IndexColumn1() = "UrlCode"
.AddIndex: .IndexName() = "UrlName": .IndexUnique() = True: .IndexColumn1() = "UrlName"

.CreateTable dbCmpCatalog
End With

With clsDB
.ClearTableStru
.TableName = "UserMast"
Rem field definitions
.AddColumn: .ColumnName() = "UsrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "UsrName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UsrPwd": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UsrUrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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
.AddColumn: .ColumnName() = "UsrPwd": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UsrUrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UsrRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "UsrCode"
Rem index definition
.AddIndex: .IndexName() = "UsrName": .IndexUnique() = True: .IndexColumn1() = "UsrName"

.CreateTable dbCmpCatalog
End With

With clsDB
.ClearTableStru
.TableName = "UserRightMst"
Rem field definitions
.AddColumn: .ColumnName() = "UhtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "UhtUrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtUsrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtSecuOptName": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UhtSecuOptTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UhtCanAdd": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtCanEdit": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtCanDelete": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtCanView": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "UhtCode"
Rem index definition
.AddIndex: .IndexName() = "UhtUrlCode": .IndexColumn1() = "UhtUrlCode"
.AddIndex: .IndexName() = "UhtUsrCode": .IndexColumn1() = "UhtUsrCode"
.AddIndex: .IndexName() = "UhtSecuOptName": .IndexColumn1() = "UhtSecuOptName"

.CreateTable dbCmpCatalog
End With

With clsDB
.ClearTableStru
.TableName = "UserRightMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "UhtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UhtUrlCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtUsrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtSecuOptName": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UhtSecuOptTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "UhtCanAdd": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtCanEdit": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtCanDelete": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtCanView": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "UhtRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "UhtCode"
Rem index definition
.AddIndex: .IndexName() = "UhtCode": .IndexUnique() = True: .IndexColumn1() = "UhtCode"
.AddIndex: .IndexName() = "UhtUrlCode": .IndexColumn1() = "UhtUrlCode"
.AddIndex: .IndexName() = "UhtUsrCode": .IndexColumn1() = "UhtUsrCode"
.AddIndex: .IndexName() = "UhtSecuOptName": .IndexColumn1() = "UhtSecuOptName"

.CreateTable dbCmpCatalog
End With


Rem InfoBox dbCmpCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbCmpDatabase

EndSub:
Set dbCmpCatalog = Nothing
Set dbCmpDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateKgtMastDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbKgtDatabase As New ADODB.Connection, dbKgtCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbKgtDatabaseFullPath) = "" Then
        dbKgtCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbKgtDatabaseFullPath
        Set dbKgtCatalog = Nothing
    Else
        ErrorBox "Database " & dbKgtDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenKgtDataSource dbKgtDatabase, mExclusiveMode:=True
If dbKgtDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbKgtCatalog.ActiveConnection = dbKgtDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 6
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
.AddColumn: .ColumnName() = "SimPckCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimPurchRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimMRPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimWslRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimRtlRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SimCode"
Rem index definition
.AddIndex: .IndexName() = "SimName": .IndexUnique() = True: .IndexColumn1() = "SimName"

.CreateTable dbKgtCatalog
End With
dbKgtCatalog.ActiveConnection.Execute "Update SubItmMast set SimMRPRate = SimWslRate where isnull(SimMRPRate) = True"

With clsDB
.ClearTableStru
.TableName = "SubItmMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SimSigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimPckCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimPurchRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimMRPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimWslRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimRtlRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SimRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SimCode"
Rem index definition
.AddIndex: .IndexName() = "SimCode": .IndexUnique() = True: .IndexColumn1() = "SimCode"
.AddIndex: .IndexName() = "SimName": .IndexUnique() = True: .IndexColumn1() = "SimName"

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SubItmRateMst"
Rem field definitions
.AddColumn: .ColumnName() = "SirCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SirSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirPckCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirPurchRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirMRPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirWslRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirRtlRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SirICode"
Rem index definition
.AddIndex: .IndexName() = "SirCode": .IndexColumn1() = "SirCode"

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SubItmRateMst_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SirCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirPckCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirPurchRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirMRPRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirWslRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirRtlRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SirRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SirICode"
Rem index definition
.AddIndex: .IndexName() = "SirCode": .IndexColumn1() = "SirCode"
.AddIndex: .IndexName() = "SirICode": .IndexUnique() = True: .IndexColumn1() = "SirICode"

.CreateTable dbKgtCatalog
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

.CreateTable dbKgtCatalog
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

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PartyMast"
Rem field definitions
.AddColumn: .ColumnName() = "PrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PrtTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
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

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PartyMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PrtTitle": .ColumnType() = adVarWChar: .ColumnWidth() = 10: .ColumnRequired() = True: .AllowZeroLength() = True
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

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PackMast"
Rem field definitions
.AddColumn: .ColumnName() = "PckCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PckName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PckDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PckOutNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PckOutSz": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PckInrNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PckInrSz": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PckRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "PckCode"
Rem index definition
.AddIndex: .IndexName() = "PckName": .IndexUnique() = True: .IndexColumn1() = "PckName"

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PackMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PckCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PckName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PckDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PckOutNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PckOutSz": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PckInrNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PckInrSz": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PckRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "PckCode"
Rem index definition
.AddIndex: .IndexName() = "PckCode": .IndexUnique() = True: .IndexColumn1() = "PckCode"
.AddIndex: .IndexName() = "PckName": .IndexUnique() = True: .IndexColumn1() = "PckName"

.CreateTable dbKgtCatalog
End With







Rem InfoBox dbKgtCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbKgtDatabase

EndSub:
Set dbKgtCatalog = Nothing
Set dbKgtDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateKgtTranDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbKgtDatabase As New ADODB.Connection, dbKgtCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbKgtDatabaseFullPath) = "" Then
        dbKgtCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbKgtDatabaseFullPath
        Set dbKgtCatalog = Nothing
    Else
        ErrorBox "Database " & dbKgtDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenKgtDataSource dbKgtDatabase, mExclusiveMode:=True
If dbKgtDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbKgtCatalog.ActiveConnection = dbKgtDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 8
    End If
End If

With clsDB
.ClearTableStru
.TableName = "PurchHdr"
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
.AddColumn: .ColumnName() = "PuhPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhOutPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhBasicAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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
.AddIndex: .IndexName() = "PuhPrtCode": .IndexColumn1() = "PuhPrtCode"

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PurchHdr_Log"
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
.AddColumn: .ColumnName() = "PuhPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PuhOutPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhBasicAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PuhDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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
.AddIndex: .IndexName() = "PuhPrtCode": .IndexColumn1() = "PuhPrtCode"

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PurchDtl"
Rem field definitions
.AddColumn: .ColumnName() = "PurCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PurSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurPckCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurOutPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurOutPckNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurInrPckSz": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurInrPckNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurMRP": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurWslRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurRtlRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurBasicAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscableAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscType": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurTaxableAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurTaxType": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "PurchDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "PurCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurPckCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurOutPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurOutPckNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurInrPckSz": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurInrPckNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurMRP": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurWslRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurRtlRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurBasicAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscableAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscType": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurTaxableAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurTaxType": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SaleHdr"
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
.AddColumn: .ColumnName() = "SahPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahOutPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahBasicAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahOtherAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahROffAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SahCode"
Rem index definition
.AddIndex: .IndexName() = "SahVtmCodeVchNo": .IndexColumn1() = "SahVtmCode": .IndexColumn2() = "SahVchNo"
.AddIndex: .IndexName() = "SahDate": .IndexColumn1() = "SahDate"
.AddIndex: .IndexName() = "SahPrtCode": .IndexColumn1() = "SahPrtCode"

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SaleHdr_Log"
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
.AddColumn: .ColumnName() = "SahPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahOutPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahBasicAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahOtherAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahROffAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SahCode"
Rem index definition
.AddIndex: .IndexName() = "SahCode": .IndexUnique() = True: .IndexColumn1() = "SahCode"
.AddIndex: .IndexName() = "SahVtmCodeVchNo": .IndexColumn1() = "SahVtmCode": .IndexColumn2() = "SahVchNo"
.AddIndex: .IndexName() = "SahDate": .IndexColumn1() = "SahDate"
.AddIndex: .IndexName() = "SahPrtCode": .IndexColumn1() = "SahPrtCode"

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SaleDtl"
Rem field definitions
.AddColumn: .ColumnName() = "SalCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SalSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalPckCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalPurCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalPurICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalOutPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalOutPckNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalInrPckSz": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalInrPckNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalMRP": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalWslRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRtlRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalBasicAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscType": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscableAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxType": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxableAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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

.CreateTable dbKgtCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SaleDtl_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SalCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalStkCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalStkICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalPckCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalPurCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalPurICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 150: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalOutPckQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalOutPckNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalInrPckSz": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalInrPckNm": .ColumnType() = adVarWChar: .ColumnWidth() = 5: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalQty": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalMRP": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalWslRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalRtlRate": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalAmount": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalBasicAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscType": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscableAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalDiscAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxType": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxableAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalTaxAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
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

.CreateTable dbKgtCatalog
End With







Rem InfoBox dbKgtCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbKgtDatabase

EndSub:
Set dbKgtCatalog = Nothing
Set dbKgtDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateKgtComDatabase(Optional ByRef FormProgStatus As frmProgressStatus)
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
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 7
    End If
End If

Rem link table *****************************************************************************
With clsDB
.ClearLinkStru
.AddLink: .LinkTableName() = "SubItmMast": .LinkDbSource() = dbKgtDatabaseFullPath
.AddLink: .LinkTableName() = "PackMast": .LinkDbSource() = dbKgtDatabaseFullPath
.AddLink: .LinkTableName() = "SubItmGrpMst": .LinkDbSource() = dbKgtDatabaseFullPath
.AddLink: .LinkTableName() = "PartyMast": .LinkDbSource() = dbKgtDatabaseFullPath
.AddLink: .LinkTableName() = "PurchHdr": .LinkDbSource() = dbKgtDatabaseFullPath
.AddLink: .LinkTableName() = "PurchDtl": .LinkDbSource() = dbKgtDatabaseFullPath
.AddLink: .LinkTableName() = "SaleHdr": .LinkDbSource() = dbKgtDatabaseFullPath
.AddLink: .LinkTableName() = "SaleDtl": .LinkDbSource() = dbKgtDatabaseFullPath

.CreateLink dbComCatalog
End With

With clsDB
.ClearViewStru
.ViewName = "vewSaleTran"
.CommandStr = "SELECT SaleDtl.*, SaleHdr.*, PartyMast.*, SubItmMast.*, StsnMast.*, AreaMast.*, VTypMast.*" _
    & " FROM (((((SaleDtl" _
    & " INNER JOIN SaleHdr ON SaleDtl.SalCode = SaleHdr.SahCode)" _
    & " INNER JOIN VTypMast ON SaleHdr.SahVtmCode = VTypMast.VtmCode)" _
    & " INNER JOIN SubItmMast ON SaleDtl.SalSimCode = SubItmMast.SimCode)" _
    & " INNER JOIN PartyMast ON SaleHdr.SahPrtCode = PartyMast.PrtCode)" _
    & " INNER JOIN AreaMast ON PartyMast.PrtAraCode = AreaMast.AraCode)" _
    & " INNER JOIN StsnMast ON PartyMast.PrtStnCode = StsnMast.StnCode"

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

