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

