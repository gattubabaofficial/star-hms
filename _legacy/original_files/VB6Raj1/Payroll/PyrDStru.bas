Attribute VB_Name = "PayrollDataStru"
Option Explicit

Public Sub CreatePyrDatabase(ByVal mAddMode As Boolean, Optional ByRef FormProgStatus As frmProgressStatus)
Dim mTableStru As adTableStru, dbPyrDatabase As New ADODB.Connection, dbPyrCatalog As New ADOX.Catalog, clsDB As clsDataStru

If mAddMode = True Then
    If Dir(dbPyrDatabaseFullPath) = "" Then
        dbPyrCatalog.Create "Provider=" & DbProvider & ";Data Source=" & dbPyrDatabaseFullPath
        Set dbPyrCatalog = Nothing
    Else
        ErrorBox "Database " & dbPyrDatabaseFullPath & " already exist !!!"
        GoTo EndSub
    End If
End If

OpenPyrDataSource dbPyrDatabase, mExclusiveMode:=True
If dbPyrDatabase.State <> 1 Then
    ErrorBox Err.Description
    GoTo EndSub
End If
Set dbPyrCatalog.ActiveConnection = dbPyrDatabase
Set clsDB = New clsDataStru
If Not FormProgStatus Is Nothing Then
    If FormProgStatus.Visible = True Then
        Set clsDB.FormProgStatus = FormProgStatus
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 14
    End If
End If

With clsDB
.ClearTableStru
.TableName = "EmpMast"
Rem field definitions
.AddColumn: .ColumnName() = "EmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "EmpName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EmpAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpDptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpDsgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpJoinDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpBSalary": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpSelfPFPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpSelfPFAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpSelfESICPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpSelfESICAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpCoPFPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpCoPFAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpHRAPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpHRAAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpDAPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpDAAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpNSalary": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpWrkTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpHalfDayTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpMinWrkTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpAddOT": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpCutUT": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpMnLeaves": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpYrLeaves": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpWeeklyOff": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpJobState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpSftCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "EmpCode"
Rem index definition
.AddIndex: .IndexName() = "EmpName": .IndexUnique() = True: .IndexColumn1() = "EmpName"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "EmpMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "EmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EmpName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "EmpAhCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpDptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpDsgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpJoinDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpBSalary": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpSelfPFPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpSelfPFAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpSelfESICPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpSelfESICAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpCoPFPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpCoPFAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpHRAPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpHRAAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpDAPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpDAAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpNSalary": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpWrkTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpHalfDayTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpMinWrkTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpAddOT": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpCutUT": .ColumnType() = adBoolean: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpMnLeaves": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpYrLeaves": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpWeeklyOff": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpJobState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpSftCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "EmpRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "EmpCode"
Rem index definition
.AddIndex: .IndexName() = "EmpCode": .IndexUnique() = True: .IndexColumn1() = "EmpCode"
.AddIndex: .IndexName() = "EmpName": .IndexUnique() = True: .IndexColumn1() = "EmpName"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DeptMast"
Rem field definitions
.AddColumn: .ColumnName() = "DptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "DptName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DptRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "DptCode"
Rem index definition
.AddIndex: .IndexName() = "DptName": .IndexUnique() = True: .IndexColumn1() = "DptName"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DeptMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "DptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DptName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DptRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "DptCode"
Rem index definition
.AddIndex: .IndexName() = "DptCode": .IndexUnique() = True: .IndexColumn1() = "DptCode"
.AddIndex: .IndexName() = "DptName": .IndexUnique() = True: .IndexColumn1() = "DptName"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DesgMast"
Rem field definitions
.AddColumn: .ColumnName() = "DsgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "DsgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DsgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "DsgCode"
Rem index definition
.AddIndex: .IndexName() = "DsgName": .IndexUnique() = True: .IndexColumn1() = "DsgName"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "DesgMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "DsgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DsgName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "DsgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "DsgCode"
Rem index definition
.AddIndex: .IndexName() = "DsgCode": .IndexUnique() = True: .IndexColumn1() = "DsgCode"
.AddIndex: .IndexName() = "DsgName": .IndexUnique() = True: .IndexColumn1() = "DsgName"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "Attendance"
Rem field definitions
.AddColumn: .ColumnName() = "AtdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AtdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "AtdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AtdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AtdEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AtdDptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdDsgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdSftCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdStatus": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdStartTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdEndTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "AtdICode"
Rem index definition
.AddIndex: .IndexName() = "AtdCodeICode": .IndexColumn1() = "AtdCode": .IndexColumn2() = "AtdICode"
.AddIndex: .IndexName() = "AtdCodeSNo": .IndexColumn1() = "AtdCode": .IndexColumn2() = "AtdSno"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "Attendance_Log"
Rem field definitions
.AddColumn: .ColumnName() = "AtdCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AtdICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AtdSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AtdDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AtdEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "AtdDptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdDsgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdSftCode": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdStatus": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdStartTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdEndTime": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdNarr": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "AtdRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "AtdICode"
Rem index definition
.AddIndex: .IndexName() = "AtdICode": .IndexUnique() = True: .IndexColumn1() = "AtdICode"
.AddIndex: .IndexName() = "AtdCodeICode": .IndexColumn1() = "AtdCode": .IndexColumn2() = "AtdICode"
.AddIndex: .IndexName() = "AtdCodeSNo": .IndexColumn1() = "AtdCode": .IndexColumn2() = "AtdSno"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "HoliMast"
Rem field definitions
.AddColumn: .ColumnName() = "HlmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "HlmDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HlmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HlmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "HlmCode"
Rem index definition
.AddIndex: .IndexName() = "HlmDate": .IndexUnique() = True: .IndexColumn1() = "HlmDate"
.AddIndex: .IndexName() = "HlmName": .IndexColumn1() = "HlmName"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "HoliMast_Log"
Rem field definitions
.AddColumn: .ColumnName() = "HlmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HlmDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HlmName": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HlmRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlmRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "HlmCode"
Rem index definition
.AddIndex: .IndexName() = "HlmCode": .IndexUnique() = True: .IndexColumn1() = "HlmCode"
.AddIndex: .IndexName() = "HlmDate": .IndexUnique() = True: .IndexColumn1() = "HlmDate"
.AddIndex: .IndexName() = "HlmName": .IndexColumn1() = "HlmName"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "HoliGrant"
Rem field definitions
.AddColumn: .ColumnName() = "HlgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "HlgHlmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HlgDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HlgEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlgDptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlgDsgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlgAlwState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "HlgCode"
Rem index definition
.AddIndex: .IndexName() = "HlgHlmCode": .IndexColumn1() = "HlgHlmCode"
.AddIndex: .IndexName() = "HlgDate": .IndexColumn1() = "HlgDate"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "HoliGrant_Log"
Rem field definitions
.AddColumn: .ColumnName() = "HlgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HlgHlmCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HlgDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "HlgEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlgDptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlgDsgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlgAlwState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlgRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "HlgRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "HlgCode"
Rem index definition
.AddIndex: .IndexName() = "HlgCode": .IndexUnique() = True: .IndexColumn1() = "HlgCode"
.AddIndex: .IndexName() = "HlgHlmCode": .IndexColumn1() = "HlgHlmCode"
.AddIndex: .IndexName() = "HlgDate": .IndexColumn1() = "HlgDate"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SalarySlip"
Rem field definitions
.AddColumn: .ColumnName() = "SslCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False: .AutoIncrement() = True
.AddColumn: .ColumnName() = "SslSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslDptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslDsgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslStartDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslEndDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslPresentDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHalfDayDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslWeeklyOffDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHolidayDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslLeaveDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslAbsentDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslTotalDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslPresentTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHalfDayTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslWeeklyOffTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHolidayTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslLeaveTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslAbsentTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslTotalTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslExtraTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslExtraDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslPayableDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslPayableTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslAddDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslAddTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslNetPayDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslNetPayTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslBSalary": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslSelfPFPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslSelfPFAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslSelfESICPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslSelfESICAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslCoPFPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslCoPFAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHRAPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHRAAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslDAPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslDAAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslNSalary": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslPaidStatus": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslPaidDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
.PrimaryKey = "SslICode"
Rem index definition
.AddIndex: .IndexName() = "SslCodeICode": .IndexColumn1() = "SslCode": .IndexColumn2() = "SslICode"
.AddIndex: .IndexName() = "SslCodeSNo": .IndexColumn1() = "SslCode": .IndexColumn2() = "SslSno"

.CreateTable dbPyrCatalog
End With

With clsDB
.ClearTableStru
.TableName = "SalarySlip_Log"
Rem field definitions
.AddColumn: .ColumnName() = "SslCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslICode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslSno": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslDate": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslEmpCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslDptCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslDsgCode": .ColumnType() = adInteger: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslStartDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslEndDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslPresentDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHalfDayDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslWeeklyOffDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHolidayDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslLeaveDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslAbsentDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslTotalDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslPresentTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHalfDayTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslWeeklyOffTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHolidayTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslLeaveTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslAbsentTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslTotalTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslExtraTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslExtraDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslPayableDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslPayableTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslAddDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslAddTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslNetPayDays": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslNetPayTime": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslBSalary": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslSelfPFPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslSelfPFAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslSelfESICPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslSelfESICAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslCoPFPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslCoPFAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHRAPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslHRAAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslDAPer": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslDAAmt": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslNSalary": .ColumnType() = adDouble: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslPaidStatus": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslPaidDt": .ColumnType() = adDate: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
.AddColumn: .ColumnName() = "SslRemark": .ColumnType() = adVarWChar: .ColumnWidth() = 50: .ColumnRequired() = True: .AllowZeroLength() = True
.AddColumn: .ColumnName() = "SslRecState": .ColumnType() = adSmallInt: .ColumnWidth() = Empty: .ColumnRequired() = True: .AllowZeroLength() = False
Rem primary key definition
Rem .PrimaryKey = "SslICode"
Rem index definition
.AddIndex: .IndexName() = "SslICode": .IndexUnique() = True: .IndexColumn1() = "SslICode"
.AddIndex: .IndexName() = "SslCodeICode": .IndexColumn1() = "SslCode": .IndexColumn2() = "SslICode"
.AddIndex: .IndexName() = "SslCodeSNo": .IndexColumn1() = "SslCode": .IndexColumn2() = "SslSno"

.CreateTable dbPyrCatalog
End With

Rem InfoBox dbPyrCatalog.ActiveConnection.Properties("Data Source Name") & ", Done !!!"

CloseDataSource dbPyrDatabase

EndSub:
Set dbPyrCatalog = Nothing
Set dbPyrDatabase = Nothing
Set clsDB = Nothing
Exit Sub

End Sub

Public Sub CreatePyrComDatabase(Optional ByRef FormProgStatus As frmProgressStatus)
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
        FormProgStatus.pbar1.Min = 0: FormProgStatus.pbar1.Max = 3
    End If
End If

Rem link table *****************************************************************************
With clsDB
.ClearLinkStru
.AddLink: .LinkTableName() = "EmpMast": .LinkDbSource() = dbPyrDatabaseFullPath
.AddLink: .LinkTableName() = "Attendance": .LinkDbSource() = dbPyrDatabaseFullPath
.AddLink: .LinkTableName() = "HoliGrant": .LinkDbSource() = dbPyrDatabaseFullPath

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

