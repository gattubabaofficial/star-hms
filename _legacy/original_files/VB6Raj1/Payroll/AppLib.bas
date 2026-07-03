Attribute VB_Name = "ApplicationLibrary"
Option Explicit

Public Sub Main()
Call InitCommonVar
Call InitPyrVar

sAppPath = App.Path
sAppDataPath = sAppPath & "\Data"
sCmpDataPath = sAppDataPath
sCmpDatabaseName = "Company.Mdb"

sDefaultDate = Date
sBooksFromDate = DateSerial(2013, 4, 1)
sBooksToDate = DateSerial(2014, 3, 31)
sFinYrStartDate = sBooksFromDate
sFinYrEndDate = sBooksToDate

ChDir sAppPath
Load frmMyMenu
frmMyMenu.Show
End Sub

Public Sub RemoveAppNullValue()
Rem common
RemoveAcNullValue
RemoveStNullValue
RemoveGrpNullValue
RemoveComNullValue

Rem application specific
RemovePyrNullValue

InfoBox "Done !!!"

End Sub

