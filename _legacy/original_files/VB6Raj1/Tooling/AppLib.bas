Attribute VB_Name = "ApplicationLibrary"
Option Explicit

Public Sub Main()
sAppPath = App.Path

sDefaultDate = Date
sBooksFromDate = DateSerial(2013, 4, 1)
sBooksToDate = DateSerial(2014, 3, 31)
sFinYrStartDate = sBooksFromDate
sFinYrEndDate = sBooksToDate

ChDir sAppPath
Load frmMyMenu
frmMyMenu.Show
frmMyMenu.ZOrder

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

