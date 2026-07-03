Attribute VB_Name = "SysConst"
Rem Common Modules, Avoid Application specific changes
Option Explicit

Public Type SelectQueryStru
Field_Expr() As Variant
Field_Alias() As Variant
Field_Title() As Variant
Field_Show() As Variant
Field_Attrib() As Variant
Field_Link() As Variant
Field_Align() As Variant
Field_Width() As Variant
Field_NumFmt() As Variant
Field_Invert() As Variant
From_Table() As Variant
From_Alias() As Variant
Join_Type() As Variant
Join_Table() As Variant
Join_Alias() As Variant
Join_Match() As Variant
Filter_Conj() As Variant
Filter_Expr() As Variant
Filter_Attrib() As Variant
Groupby_Expr() As Variant
Orderby_Expr() As Variant
Orderby_Attrib() As Variant
Sqlstr As String
End Type

Public sWinComputerName As String, sWinUserName As String
Public sAppPath As String, sAppDataPath As String, sCmpDataPath As String, sLoginUIdCode As Long, sLoginUserCode As Long
Public sDefaultDate As Date, sCmpDatabaseName As String, sAcDatabaseName As String, sStDatabaseName As String, sGrpDatabaseName As String, sComDatabaseName As String, sAppOptFileName As String, sUIdCodeFileName As String, sAcsPermFileName As String, sBkpOldFileName As String
Public sCmpBookStartDate As Date, sCmpBookEndDate As Date, sFinYrStartDate As Date, sFinYrEndDate As Date, sFinYrCmpCode As Integer
Rem General constant declarations
Public Const cSPC = " "
Public Const cSYSREQD = True
Public Const cSHOWITEM = True
Public Const cOPSTKCODE = -1
Public Const cOPJRNCODE = -1
Public Const cSYSBUSY_ACS_DENIED = "System Busy / Access Denied, Try Again !!!"
Public Const cSYSTEM_BUSY = "System Busy ,Try Again !!!"
Public Const cACCESS_DENIED = "Access Denied, Try Again !!!"
Public Const cUHT_SECUOPTNAME_ANY = "<<Any>>"

Rem General understable constant declarations
Public Const cADDBAL = True
Public Const cREMOVEBAL = False
Public Const cLONGCODESTRFMT = "0000000000"
Public Const cINTCODESTRFMT = "00000"

Rem Field Attributes
Public Const cFAT_UNKNOWN = 0
Public Const cFAT_ARCHIVE = 1
Public Const cFAT_HIDDEN = 2
Public Const cFAT_SYSTEM = 3
Rem Form(Edit) Mode flags
Public Const cFORM_ADDMODE = 0
Public Const cFORM_EDITMODE = 1
Public Const cFORM_SMRYMODE = 2
Rem Record Status flags
Public Const cREC_NEW = 0
Public Const cREC_ADDED = 1
Public Const cREC_EDITED = 2
Public Const cREC_DELETED = 3
Public Const cREC_CANCELED = 4
Public Const cREC_UNCHANGED = 5
Rem Accounting flags
Public Const cDR_FLAG = "Dr"
Public Const cCR_FLAG = "Cr"
Public Const cNODRCR_FLAG = "__"
Rem Stock Issue Receipts flags
Public Const cRCPT_FLAG = "Rc"
Public Const cISSUE_FLAG = "Is"
Public Const cNOISRC_FLAG = "__"

Rem Common color constants
Public Const cYELLOWLIGHT = 9894650
Public Const cREDLIGHT = 8421631
Public Const cGREENLIGHT = 12648384
Public Const cBROWNLIGHT = 8438015
Public Const cCYANLIGHT = 16777152

Rem Open Statement File Modes
Public Const cFILEMODE_RANDOM = 0
Public Const cFILEMODE_APPEND = 1
Public Const cFILEMODE_BINARY = 2
Public Const cFILEMODE_INPUT = 3
Public Const cFILEMODE_OUTPUT = 4

Rem General messages
Public Const cINVALID_FINYRDATE = "Invalid Financial Year Date"
Public Const cINVALID_BOOKSDATE = "Invalid Books Date"

Rem date/time related constants
Public Const cSYSDATEFMT = "mm/dd/yyyy"
Public Const cMYDATEFMT = "dd/mm/yyyy"
Public Const cUNKNOWNDATE = #1/1/1975#
Public Const cDAYMINUTES = 1440

Rem summary (totaling) evaluation options
Public Const cSMRYEVAL_EACHREC = 1
Public Const cSMRYEVAL_FIELDCHANGE = 2

Rem search match options
Public Const cSEARCH_COMPLETESTR = 1
Public Const cSEARCH_LEFTLIKESTR = 2
Public Const cSEARCH_MIDSTR = 3

Public Property Get DbProvider() As String
DbProvider = "Microsoft.Jet.Oledb.4.0"
End Property

