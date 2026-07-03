Attribute VB_Name = "ApplicationMain"
Option Explicit

Public Sub Main()

Call InitCommonVar
Call InitTlgVar
Call InitPyrVar

sAppPath = App.Path
sAppDataPath = sAppPath     ' & "\Data"
sCmpDataPath = ""
sCmpDatabaseName = "Company.Mdb"

sDefaultDate = Date
sCmpBookStartDate = cUNKNOWNDATE
sCmpBookEndDate = cUNKNOWNDATE
sFinYrStartDate = cUNKNOWNDATE
sFinYrEndDate = cUNKNOWNDATE
sFinYrCmpCode = 0

Load frmMain
frmMain.Show
frmMain.ZOrder
frmMain.Hide

ChDir sAppPath
Load frmMyMenu
frmMyMenu.Show
frmMyMenu.ZOrder

'''Load frmCompanyMaster
'''frmCompanyMaster.Show
'''frmCompanyMaster.ZOrder

End Sub

Public Sub RemoveAppNullValue()
Rem common
RemoveAcNullValue
RemoveStNullValue
RemoveGrpNullValue
RemoveComNullValue

Rem application specific
RemoveTlgNullValue

InfoBox "Done !!!"

End Sub

