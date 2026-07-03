Attribute VB_Name = "ApplicationLibrary"
Option Explicit

Public Sub Main()
Call InitCommonVar
''Call InitHmsVar
''Call InitPyrVar

sAppPath = App.Path
sAppDataPath = sAppPath & "\Data"
sCmpDataPath = ""
sCmpDatabaseName = "Company.Mdb"

sDefaultDate = Date
sCmpBookStartDate = cUNKNOWNDATE
sCmpBookEndDate = cUNKNOWNDATE
sFinYrStartDate = cUNKNOWNDATE
sFinYrEndDate = cUNKNOWNDATE
sFinYrCmpCode = 0

''Load frmMain
''frmMain.Show
''frmMain.ZOrder
''frmMain.Hide
''
''ChDir sAppPath
''Load frmCompanyMaster
''frmCompanyMaster.Show
''frmCompanyMaster.ZOrder

sCmpDataPath = sAppDataPath ' temporarily till company table is not used
ChDir sAppPath
Load frmMyMenu
frmMyMenu.Show
End Sub

Public Sub RemoveAppNullValue()
RemoveAcNullValue
RemoveStNullValue
RemoveGrpNullValue
RemoveComNullValue

InfoBox "Done !!!"

End Sub


