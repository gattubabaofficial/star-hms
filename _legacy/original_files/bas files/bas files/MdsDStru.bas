Attribute VB_Name = "MdsDataStru"

Option Explicit

Public Sub CreateMdsMastDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbMdsDatabase As New ADODB.Connection, dbMdsCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbMdsDatabaseFullPath) = "" Then
        dbMdsCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbMdsDatabaseFullPath
        Set dbMdsCatalog = Nothing
    Else
        ErrorBox "Database " & dbMdsDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenMdsDataSource dbMdsDatabase, mExclusiveMode:=True
If dbMdsDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbMdsCatalog.ActiveConnection = dbMdsDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 8
    End If
End If

With clsDB
.ClearTableStru
.TableName = "MedItmMast"
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

.CreateTable dbMdsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedItmMast_Log"
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

.CreateTable dbMdsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedItmGrpMst"
Rem field definitions
.AddColumn: .ColumnName() = "SigCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SigName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SigDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SigRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SigCode"
Rem index definition
.AddIndex: .IndexName() = "SigName": .IndexUnique() = True: .IndexColumn1() = "SigName"

.CreateTable dbMdsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedItmGrpMst_Log"
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

.CreateTable dbMdsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPrtMast"
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

.CreateTable dbMdsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPrtMast_Log"
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

.CreateTable dbMdsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPrtGrpMst"
Rem field definitions
.AddColumn: .ColumnName() = "PgmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "PgmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PgmDesc": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PgmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "PgmCode"
Rem index definition
.AddIndex: .IndexName() = "PgmName": .IndexUnique() = True: .IndexColumn1() = "PgmName"

.CreateTable dbMdsCatalog
End With

With clsDB
.ClearTableStru
.TableName = "MedPrtGrpMst_Log"
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

.CreateTable dbMdsCatalog
End With













Rem InfoBox dbMdsCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbMdsDatabase

EndSub:
Set dbMdsCatalog = Nothing
Set dbMdsDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateMdsTranDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbMdsDatabase As New ADODB.Connection, dbMdsCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbMdsDatabaseFullPath) = "" Then
        dbMdsCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbMdsDatabaseFullPath
        Set dbMdsCatalog = Nothing
    Else
        ErrorBox "Database " & dbMdsDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenMdsDataSource dbMdsDatabase, mExclusiveMode:=True
If dbMdsDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbMdsCatalog.ActiveConnection = dbMdsDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 8
    End If
End If

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
.AddColumn: .ColumnName() = "PuhPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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
.AddIndex: .IndexName() = "PuhPrtCode": .IndexColumn1() = "PuhPrtCode"
.AddIndex: .IndexName() = "PuhPttCode": .IndexColumn1() = "PuhPttCode"

.CreateTable dbMdsCatalog
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
.AddColumn: .ColumnName() = "PuhPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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
.AddIndex: .IndexName() = "PuhPrtCode": .IndexColumn1() = "PuhPrtCode"
.AddIndex: .IndexName() = "PuhPttCode": .IndexColumn1() = "PuhPttCode"

.CreateTable dbMdsCatalog
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
.AddColumn: .ColumnName() = "PurPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbMdsCatalog
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
.AddColumn: .ColumnName() = "PurPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "PurSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "PurSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbMdsCatalog
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
.AddColumn: .ColumnName() = "SahPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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
.AddColumn: .ColumnName() = "SahRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SahRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SahCmpCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SahCode"
Rem index definition
.AddIndex: .IndexName() = "SahVtmCodeVchNo": .IndexColumn1() = "SahVtmCode": .IndexColumn2() = "SahVchNo"
.AddIndex: .IndexName() = "SahDate": .IndexColumn1() = "SahDate"
.AddIndex: .IndexName() = "SahPrtCode": .IndexColumn1() = "SahPrtCode"
.AddIndex: .IndexName() = "SahPttCode": .IndexColumn1() = "SahPttCode"

.CreateTable dbMdsCatalog
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
.AddColumn: .ColumnName() = "SahPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
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
.AddIndex: .IndexName() = "SahPttCode": .IndexColumn1() = "SahPttCode"

.CreateTable dbMdsCatalog
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
.AddColumn: .ColumnName() = "SalPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbMdsCatalog
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
.AddColumn: .ColumnName() = "SalPrtCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalPttCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SalSimCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalItrCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SalSimRefNo": .ColumnType() = adVarWChar: .ColumnWidth() = 25: .ColumnRequired() = True: .AllowZeroLength() = False
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

.CreateTable dbMdsCatalog
End With


























Rem InfoBox dbMdsCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbMdsDatabase

EndSub:
Set dbMdsCatalog = Nothing
Set dbMdsDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreateMdsComDatabase(Optional ByRef FormProgStatus As frmProgressStatus)
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
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 8
    End If
End If

Rem link table *****************************************************************************
With clsDB
.ClearLinkStru
.AddLink: .LinkTableName() = "MedItmMast": .LinkDbSource() = dbMdsDatabaseFullPath
.AddLink: .LinkTableName() = "MedItmGrpMst": .LinkDbSource() = dbMdsDatabaseFullPath
.AddLink: .LinkTableName() = "MedPrtMast": .LinkDbSource() = dbMdsDatabaseFullPath
.AddLink: .LinkTableName() = "MedPrtGrpMst": .LinkDbSource() = dbMdsDatabaseFullPath
.AddLink: .LinkTableName() = "MedPurchHdr": .LinkDbSource() = dbMdsDatabaseFullPath
.AddLink: .LinkTableName() = "MedPurchDtl": .LinkDbSource() = dbMdsDatabaseFullPath
.AddLink: .LinkTableName() = "MedSaleHdr": .LinkDbSource() = dbMdsDatabaseFullPath
.AddLink: .LinkTableName() = "MedSaleDtl": .LinkDbSource() = dbMdsDatabaseFullPath

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

