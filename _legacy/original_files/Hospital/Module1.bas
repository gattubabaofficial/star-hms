Attribute VB_Name = "Module1"

Option Explicit




Private Sub SmryList()
Dim gcolcount As Integer, acount As Integer, mLow As Integer, mHigh As Integer, mPos As Integer, srow As Long, mColCount As Integer
Dim aAcntBal As Variant, mBal As Double, mQryStr As String
Dim mCount_Tot As Double, mAmtAftDisc_Tot As Double, mDiscAmt_Tot As Double

Me.MousePointer = vbHourglass
If datRecset.State = 1 Then
    CloseTable datRecset
End If
RefreshDatabase dbHmsDatabase
RefreshDatabase dbAcDatabase
RefreshDatabase dbGrpDatabase
RefreshDatabase dbComDatabase
clsListStru.Clear

If optMonthwise.Value = True Or optDatewise.Value = True Or optPatientNamewise.Value = True Or optPatientRegNoWise.Value = True Or optServiceWise.Value = True Or optServGrpWise.Value = True Or optServGrpNServWise.Value = True Or optVTypewise.Value = True Then
    If optMonthwise.Value = True Then
        Call CreateMonthlySrmyList
        
    ElseIf optDatewise.Value = True Then
        Call CreateDailySrmyList
        
    ElseIf optPatientNamewise.Value = True Then
        Call CreatePatNameSmryList
        
    ElseIf optPatientRegNoWise.Value = True Then
        Call CreatePatRegNoSmryList
        
    ElseIf optServiceWise.Value = True Then
        Call CreateServNameSmryList
        
    ElseIf optServGrpWise.Value = True Then
        Call CreateServGrpNameSmryList
    
    ElseIf optServGrpNServWise.Value = True Then
        Call CreateServGrpNServNameSmryList
    
    ElseIf optVTypewise.Value = True Then
        Call CreateVTypeNameSmryList
    
    End If
    
ElseIf optDetailed.Value = True Then
    Call CreateDetailedSrmyList
    
ElseIf optExpanded.Value = True Then
    Call CreateExpandedSrmyList
    
End If

Mfgrd1.Height = Int(Mfgrd1.Height / Mfgrd1.RowHeightMin) * Mfgrd1.RowHeightMin
Mfgrd1.Cols = clsListStru.UFields + 1
gcolcount = 0
mLow = clsListStru.LFields
mHigh = clsListStru.UFields
For acount = mLow To mHigh
    With Mfgrd1
    'If .Cols <= gcolcount Then
    '    .Cols = gcolcount + 1
    'End If
    .ColAlignment(gcolcount) = clsListStru.Field_Align(acount)
    If clsListStru.Field_Show(acount) = True Then
        .ColWidth(gcolcount) = clsListStru.Field_Width(acount)
    Else
        .ColWidth(gcolcount) = 0
    End If
    .TextMatrix(0, gcolcount) = clsListStru.Field_Title(acount)
    End With
    
    gcolcount = gcolcount + 1
Next acount
If FlexColsWidth(Mfgrd1) > Mfgrd1.Width Then
    Mfgrd1.SelectionMode = flexSelectionFree
Else
    Mfgrd1.SelectionMode = flexSelectionByRow
End If

mCount_Tot = 0: mAmtAftDisc_Tot = 0: mDiscAmt_Tot = 0
srow = 1
MoveRecToFirst datRecset
With datRecset
If .RecordCount > 0 Then
    Do While .EOF = False
        If optMonthwise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnYrMonth")) = .fields("TrnYrMonth")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnMnYear")) = MonthName(Val(Right(.fields("TrnYrMonth"), 2))) & "-" & Left(.fields("TrnYrMonth"), 4)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
            
        ElseIf optDatewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDateYMD")) = Format(.fields("TrnDate"), "yyyymmdd")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = Dtoc(.fields("TrnDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
            
        ElseIf optPatientNamewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
            
        ElseIf optPatientRegNoWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ToMyNumFmt(.fields("PttRegNo"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
            
        ElseIf optServiceWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = .fields("TrnSrvName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
        
        ElseIf optServGrpWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSgpName")) = .fields("TrnSgpName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
        
        ElseIf optServGrpNServWise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSgpName")) = .fields("TrnSgpName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = .fields("TrnSrvName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
        
        ElseIf optVTypewise.Value = True Then
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVtmName")) = .fields("TrnVtmName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(.fields("TrnCount"), mDecimals:=0)
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(.fields("TrnAmtAftDisc_sum"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(.fields("TrnDiscAmt_sum"))
        
        ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
            clsPCG.GetData .fields("PttPcgCode")
            clsARA.GetData .fields("PttAraCode")
            clsSTN.GetData .fields("PttStnCode")
            clsVTM.GetData .fields("TrnVtmCode")
            
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = .fields("tTrnSmryId")      'Format(.fields("TrnDate"), "yyyymmdd") & .fields("TrnType") & Format(.fields("TrnCode"), "0000000")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnType")) = .fields("TrnType")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = .fields("TrnCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = clsVTM.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = .fields("TrnVchNo")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = Dtoc(.fields("TrnDate"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc")) = ToMyNumFmt(.fields("TrnAmtAftDisc"))
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt")) = ToMyNumFmt(.fields("TrnDiscAmt"))
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttCode")) = .fields("PttCode")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = .fields("PttName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = .fields("PttRegNo")
            If optExpanded.Value = True Then
                Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = .fields("TrnSrvName")
            End If
            ' ------------------------------------
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = .fields("PttRefName")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = .fields("PttAddr")
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = clsARA.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = clsSTN.mName_str
            Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatPcgName")) = clsPCG.mName_str
        
        End If
        If optDetailed.Value = True Or optExpanded.Value = True Then
            mCount_Tot = mCount_Tot + 1
            mAmtAftDisc_Tot = mAmtAftDisc_Tot + .fields("TrnAmtAftDisc")
            mDiscAmt_Tot = mDiscAmt_Tot + .fields("TrnDiscAmt")
        Else
            mCount_Tot = mCount_Tot + .fields("TrnCount")
            mAmtAftDisc_Tot = mAmtAftDisc_Tot + .fields("TrnAmtAftDisc_sum")
            mDiscAmt_Tot = mDiscAmt_Tot + .fields("TrnDiscAmt_sum")
        End If
        
        srow = srow + 1
        If Mfgrd1.Rows < srow + 1 Then
            Mfgrd1.Rows = Mfgrd1.Rows + 1
        End If
        
        .MoveNext
    Loop
End If
End With

Rem grand total
If optMonthwise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnYrMonth")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnMnYear")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optDatewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDateYMD")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optPatientNamewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optPatientRegNoWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optServiceWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optServGrpWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSgpName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optServGrpNServWise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSgpName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optVTypewise.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVtmName")) = "Grand Total"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCount")) = ToMyNumFmt(mCount_Tot, mDecimals:=0)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc_sum")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt_sum")) = ToMyNumFmt(mDiscAmt_Tot)
    
ElseIf optDetailed.Value = True Or optExpanded.Value = True Then
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("tTrnSmryId")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnType")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("VtmName")) = "Grand Total (" & CStr(mCount_Tot) & ")"
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnVchNo")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDate")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnAmtAftDisc")) = ToMyNumFmt(mAmtAftDisc_Tot)
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnDiscAmt")) = ToMyNumFmt(mDiscAmt_Tot)
    ' ------------------------------------
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttCode")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRegNo")) = ""
    If optExpanded.Value = True Then
        Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("TrnSrvName")) = ""
    End If
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttRefName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PttAddr")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatAraName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatStnName")) = ""
    Mfgrd1.TextMatrix(srow, clsListStru.GetItemIndex("PatPcgName")) = ""

End If
srow = srow + 1
If Mfgrd1.Rows < srow + 1 Then
    Mfgrd1.Rows = Mfgrd1.Rows + 1
End If

For mColCount = 0 To Mfgrd1.Cols - 1
    Mfgrd1.TextMatrix(srow, mColCount) = ""
Next mColCount
Mfgrd1.Rows = srow + 1

SetFlexColCursor txtList1Col, Mfgrd1

Me.MousePointer = vbNormal

Rem Call CalcDrCrAmtTot

End Sub

Private Sub CreateMonthlySrmyList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="TrnYrMonth", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="TrnMnYear", mTitle:="Month", mShowItem:=True, mAlign:=1, mWidth:=2000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select format(TrnDate,'yyyy/MM') as TrnYrMonth" _
 & ",Count(*) as TrnCount" _
 & ",Sum(TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select OpgDate as TrnDate" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc" _
 & ",OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
 & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OpgCode>0 and True=False" _
 & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
 & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
If chkFByOutdReg.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OpgDate as TrnDate" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor receipt received amount
If chkFByOutdBill.Value = vbChecked Then
End If
Rem outdoor payment
'If chkFByOutdPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OphDate as TrnDate" _
'     & ",OphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdPymtHdr" _
'     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OphCode>0" _
'     & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor refund
'If chkFByOutdRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OfhDate as TrnDate" _
'     & ",(OfhRefuAmt * -1) as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdRefdHdr" _
'     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OfhCode>0" _
'     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill payment
'If chkFByOutdXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObphDate as TrnDate" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlHdr" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhDate as TrnDate" _
'     & ",(ObfhRefuAmt * -1) as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgDate as TrnDate" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
If chkFByIndrBill.Value = vbChecked Then
End If
Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphDate as TrnDate" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhDate as TrnDate" _
'     & ",(IfhRefuAmt * -1) as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill payment
'If chkFByIndrXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphDate as TrnDate" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhDate as TrnDate" _
'     & ",(IbfhRefuAmt * -1) as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtDate as TrnDate" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfDate as TrnDate" _
'     & ",(IgfRfugAmt * -1) as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " group by format(TrnDate,'yyyy/MM')" _
 & " order by format(TrnDate,'yyyy/MM')"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly


End Sub

Private Sub CreateDailySrmyList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="TrnDateYMD", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mShowItem:=True, mAlign:=1, mWidth:=2000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select TrnDate" _
 & ",Count(*) as TrnCount" _
 & ",Sum(TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select OpgDate as TrnDate" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc" _
 & ",OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
 & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OpgCode>0 and True=False" _
 & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
 & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
If chkFByOutdReg.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & "Select OpgDate as TrnDate" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor receipt received amount
If chkFByOutdBill.Value = vbChecked Then
End If
Rem outdoor payment
'If chkFByOutdPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OphDate as TrnDate" _
'     & ",OphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdPymtHdr" _
'     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OphCode>0" _
'     & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor refund
'If chkFByOutdRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OfhDate as TrnDate" _
'     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdRefdHdr" _
'     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OfhCode>0" _
'     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill payment
'If chkFByOutdXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObphDate as TrnDate" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlHdr" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhDate as TrnDate" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgDate as TrnDate" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
If chkFByIndrBill.Value = vbChecked Then
End If
Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphDate as TrnDate" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhDate as TrnDate" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill payment
'If chkFByIndrXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphDate as TrnDate" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhDate as TrnDate" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtDate as TrnDate" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfDate as TrnDate" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " group by TrnDate" _
 & " order by TrnDate"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly


End Sub

Private Sub CreatePatNameSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select PatMast.PttName,t1.TrnPttCode,PatMast.PttRegNo,PatMast.PttRefName" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select OpgPttCode as TrnPttCode" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc" _
 & ",OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
 & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OpgCode>0 and True=False" _
 & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
 & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
If chkFByOutdReg.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OpgPttCode as TrnPttCode" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor receipt received amount
If chkFByOutdBill.Value = vbChecked Then
End If
Rem outdoor payment
'If chkFByOutdPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OphPttCode as TrnPttCode" _
'     & ",OphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdPymtHdr" _
'     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OphCode>0" _
'     & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor refund
'If chkFByOutdRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OfhPttCode as TrnPttCode" _
'     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdRefdHdr" _
'     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OfhCode>0" _
'     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill payment
'If chkFByOutdXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObhPttCode as TrnPttCode" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlHdr" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhPttCode as TrnPttCode" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgPttCode as TrnPttCode" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
If chkFByIndrBill.Value = vbChecked Then
End If
Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphPttCode as TrnPttCode" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhPttCode as TrnPttCode" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill payment
'If chkFByIndrXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphPttCode as TrnPttCode" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhPttCode as TrnPttCode" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtPttCode as TrnPttCode" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfPttCode as TrnPttCode" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 inner join PatMast on t1.TrnPttCode=PatMast.PttCode" _
 & " group by PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,t1.TrnPttCode" _
 & " order by PatMast.PttName,PatMast.PttRegNo,PatMast.PttRefName,t1.TrnPttCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreatePatRegNoSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mShowItem:=True, mAlign:=1, mWidth:=2000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select PatMast.PttRegNo,t1.TrnPttCode,PatMast.PttName,PatMast.PttRefName" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select OpgPttCode as TrnPttCode" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc" _
 & ",OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
 & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OpgCode>0 and True=False" _
 & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
 & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
If chkFByOutdReg.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OpgPttCode as TrnPttCode" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor receipt received amount
If chkFByOutdBill.Value = vbChecked Then
End If
Rem outdoor payment
'If chkFByOutdPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OphPttCode as TrnPttCode" _
'     & ",OphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdPymtHdr" _
'     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OphCode>0" _
'     & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor refund
'If chkFByOutdRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OfhPttCode as TrnPttCode" _
'     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdRefdHdr" _
'     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OfhCode>0" _
'     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill payment
'If chkFByOutdXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObhPttCode as TrnPttCode" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlHdr" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhPttCode as TrnPttCode" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgPttCode as TrnPttCode" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
If chkFByIndrBill.Value = vbChecked Then
End If
Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphPttCode as TrnPttCode" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhPttCode as TrnPttCode" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill payment
'If chkFByIndrXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphPttCode as TrnPttCode" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhPttCode as TrnPttCode" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtPttCode as TrnPttCode" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfPttCode as TrnPttCode" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 inner join PatMast on t1.TrnPttCode=PatMast.PttCode" _
 & " group by PatMast.PttRegNo,PatMast.PttName,PatMast.PttRefName,t1.TrnPttCode" _
 & " order by PatMast.PttRegNo,PatMast.PttName,PatMast.PttRefName,t1.TrnPttCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateServNameSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="TrnSrvName", mTitle:="Service Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select " _
 & " t1.TrnSrvName,t1.TrnSrvCode" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc" _
 & ",OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
 & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OpgCode>0 and True=False" _
 & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
 & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
If chkFByOutdReg.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join ServMast on OutdReg.OpgSrvCode=ServMast.SrvCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor receipt received amount
If chkFByOutdBill.Value = vbChecked Then
End If
Rem outdoor payment
'If chkFByOutdPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",OphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdPymtHdr" _
'     & " inner join VTypMast on OutdPymtHdr.OphVtmCode = VTypMast.VtmCode" _
'     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OphCode>0" _
'     & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor refund
'If chkFByOutdRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdRefdHdr" _
'     & " inner join VTypMast on OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode" _
'     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OfhCode>0" _
'     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill payment
'If chkFByOutdXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObhVtmCode * - 1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlHdr" _
'     & " inner join VTypMast on OutdBlHdr.ObhVtmCode = VTypMast.VtmCode" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " inner join VTypMast on OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgVtmCode * - 1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " inner join VTypMast on IndrReg.IpgVtmCode = VTypMast.VtmCode" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
If chkFByIndrBill.Value = vbChecked Then
End If
Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " inner join VTypMast on IndrPymtHdr.IphVtmCode = VTypMast.VtmCode" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " inner join VTypMast on IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill payment
'If chkFByIndrXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " inner join VTypMast on IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " inner join VTypMast on IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " inner join VTypMast on IndrRgPymt.IgtVtmCode = VTypMast.VtmCode" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " inner join VTypMast on IndrRgRefd.IgfVtmCode = VTypMast.VtmCode" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 group by t1.TrnSrvName,t1.TrnSrvCode" _
 & " order by t1.TrnSrvName,t1.TrnSrvCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly


End Sub

Private Sub CreateServGrpNameSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="TrnSgpName", mTitle:="Service Group Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select " _
 & " t1.TrnSgpName,t1.TrnSgpCode" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc" _
 & ",OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on OutdReg.OpgSrvCode = ServMast.SrvCode" _
 & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OpgCode>0 and True=False" _
 & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
 & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
If chkFByOutdReg.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on OutdReg.OpgSrvCode=ServMast.SrvCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor receipt received amount
If chkFByOutdBill.Value = vbChecked Then
End If
Rem outdoor payment
'If chkFByOutdPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",OphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdPymtHdr" _
'     & " inner join VTypMast on OutdPymtHdr.OphVtmCode = VTypMast.VtmCode" _
'     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OphCode>0" _
'     & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor refund
'If chkFByOutdRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdRefdHdr" _
'     & " inner join VTypMast on OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode" _
'     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OfhCode>0" _
'     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill payment
'If chkFByOutdXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlHdr" _
'     & " inner join VTypMast on OutdBlHdr.ObhVtmCode = VTypMast.VtmCode" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " inner join VTypMast on OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " inner join VTypMast on IndrReg.IpgVtmCode = VTypMast.VtmCode" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
If chkFByIndrBill.Value = vbChecked Then
End If
Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " inner join VTypMast on IndrPymtHdr.IphVtmCode = VTypMast.VtmCode" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " inner join VTypMast on IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill payment
'If chkFByIndrXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " inner join VTypMast on IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " inner join VTypMast on IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " inner join VTypMast on IndrRgPymt.IgtVtmCode = VTypMast.VtmCode" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " inner join VTypMast on IndrRgRefd.IgfVtmCode = VTypMast.VtmCode" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 group by t1.TrnSgpName,t1.TrnSgpCode" _
 & " order by t1.TrnSgpName,t1.TrnSgpCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateServGrpNServNameSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="TrnSgpName", mTitle:="Service Group Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="TrnSrvName", mTitle:="Service Name", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select " _
 & " t1.TrnSgpName,t1.TrnSgpCode" _
 & ",t1.TrnSrvName,t1.TrnSrvCode" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName,OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc" _
 & ",OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on OutdReg.OpgSrvCode = ServMast.SrvCode" _
 & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OpgCode>0 and True=False" _
 & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
 & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
If chkFByOutdReg.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select SrvSgpCode as TrnSgpCode,ServGrpMst.SgpName as TrnSgpName,OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join (ServMast inner join ServGrpMst on ServMast.SrvSgpCode = ServGrpMst.SgpCode) on OutdReg.OpgSrvCode=ServMast.SrvCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor receipt received amount
If chkFByOutdBill.Value = vbChecked Then
End If
Rem outdoor payment
'If chkFByOutdPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,OphVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",OphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdPymtHdr" _
'     & " inner join VTypMast on OutdPymtHdr.OphVtmCode = VTypMast.VtmCode" _
'     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OphCode>0" _
'     & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor refund
'If chkFByOutdRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,OfhVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdRefdHdr" _
'     & " inner join VTypMast on OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode" _
'     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OfhCode>0" _
'     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill payment
'If chkFByOutdXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,ObhVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlHdr" _
'     & " inner join VTypMast on OutdBlHdr.ObhVtmCode = VTypMast.VtmCode" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,ObfhVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " inner join VTypMast on OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IpgVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " inner join VTypMast on IndrReg.IpgVtmCode = VTypMast.VtmCode" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
If chkFByIndrBill.Value = vbChecked Then
End If
Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IphVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " inner join VTypMast on IndrPymtHdr.IphVtmCode = VTypMast.VtmCode" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IfhVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " inner join VTypMast on IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill payment
'If chkFByIndrXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IbphVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " inner join VTypMast on IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IbfhVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " inner join VTypMast on IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IgtVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " inner join VTypMast on IndrRgPymt.IgtVtmCode = VTypMast.VtmCode" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfVtmCode * -1 as TrnSgpCode,VTypMast.VtmName as TrnSgpName,IgfVtmCode * -2 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " inner join VTypMast on IndrRgRefd.IgfVtmCode = VTypMast.VtmCode" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 group by t1.TrnSgpName,t1.TrnSgpCode,t1.TrnSrvName,t1.TrnSrvCode" _
 & " order by t1.TrnSgpName,t1.TrnSgpCode,t1.TrnSrvName,t1.TrnSrvCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateVTypeNameSmryList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="TrnVtmName", mTitle:="Voucher Type", mShowItem:=True, mAlign:=1, mWidth:=3000
clsListStru.AddFields mExpr:="TrnCount", mTitle:="Count", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnAmtAftDisc_sum", mTitle:="Recd.Amt", mShowItem:=True, mAlign:=7, mWidth:=1500
clsListStru.AddFields mExpr:="TrnDiscAmt_sum", mTitle:="Discount", mShowItem:=True, mAlign:=7, mWidth:=1500

mQryStr = "Select " _
 & " t1.TrnVtmName,t1.TrnVtmCode" _
 & ",Count(*) as TrnCount" _
 & ",Sum(t1.TrnAmtAftDisc) as TrnAmtAftDisc_sum" _
 & ",Sum(t1.TrnDiscAmt) as TrnDiscAmt_sum"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select OpgVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc" _
 & ",OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " inner join VTypMast on OutdReg.OpgVtmCode = VTypMast.VtmCode" _
 & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OpgCode>0 and True=False" _
 & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
 & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
If chkFByOutdReg.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select OpgVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join VTypMast on OutdReg.OpgVtmCode = VTypMast.VtmCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor receipt received amount
If chkFByOutdBill.Value = vbChecked Then
End If
Rem outdoor payment
'If chkFByOutdPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OphVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",OphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdPymtHdr" _
'     & " inner join VTypMast on OutdPymtHdr.OphVtmCode = VTypMast.VtmCode" _
'     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OphCode>0" _
'     & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor refund
'If chkFByOutdRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select OfhVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdRefdHdr" _
'     & " inner join VTypMast on OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode" _
'     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OfhCode>0" _
'     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill payment
'If chkFByOutdXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObhVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlHdr" _
'     & " inner join VTypMast on OutdBlHdr.ObhVtmCode = VTypMast.VtmCode" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select ObfhVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " inner join VTypMast on OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IpgVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " inner join VTypMast on IndrReg.IpgVtmCode = VTypMast.VtmCode" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
If chkFByIndrBill.Value = vbChecked Then
End If
Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IphVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " inner join VTypMast on IndrPymtHdr.IphVtmCode = VTypMast.VtmCode" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IfhVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " inner join VTypMast on IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill payment
'If chkFByIndrXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbphVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " inner join VTypMast on IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IbfhVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " inner join VTypMast on IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode > 0" _
'     & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgtVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " inner join VTypMast on IndrRgPymt.IgtVtmCode = VTypMast.VtmCode" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select IgfVtmCode as TrnVtmCode,VTypMast.VtmName as TrnVtmName" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " inner join VTypMast on IndrRgRefd.IgfVtmCode = VTypMast.VtmCode" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ")"
mQryStr = mQryStr & " as t1 group by t1.TrnVtmName,t1.TrnVtmCode" _
 & " order by t1.TrnVtmName,t1.TrnVtmCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateDetailedSrmyList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="tTrnSmryId", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="TrnType", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="TrnCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=2250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="TrnAmtAftDisc", mTitle:="Recd.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True

mQryStr = "Select *" _
 & ",format(TrnDate,'yyyymmdd')+TrnType+format(TrnCode,'" & CStr(cLONGCODESTRFMT) & "') as tTrnSmryId"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select " _
 & "'Opg' as TrnType" _
 & ",OpgCode as TrnCode" _
 & ",OpgDate as TrnDate" _
 & ",OpgPttCode as TrnPttCode" _
 & ",OpgVtmCode as TrnVtmCode" _
 & ",OpgVchNo as TrnVchNo" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc" _
 & ",OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
 & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OpgCode > 0 and True = False" _
 & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
 & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
If chkFByOutdReg.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select " _
     & "'Opg' as TrnType" _
     & ",OpgCode as TrnCode" _
     & ",OpgDate as TrnDate" _
     & ",OpgPttCode as TrnPttCode" _
     & ",OpgVtmCode as TrnVtmCode" _
     & ",OpgVchNo as TrnVchNo" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join ServMast on OutdReg.OpgSrvCode = ServMast.SrvCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor receipt received amount
If chkFByOutdBill.Value = vbChecked Then
End If
Rem outdoor payment
'If chkFByOutdPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Oph' as TrnType" _
'     & ",OphCode as TrnCode" _
'     & ",OphDate as TrnDate" _
'     & ",OphPttCode as TrnPttCode" _
'     & ",OphVtmCode as TrnVtmCode" _
'     & ",OphVchNo as TrnVchNo" _
'     & ",OphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdPymtHdr" _
'     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OphCode > 0" _
'     & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor refund
'If chkFByOutdRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ofh' as TrnType" _
'     & ",OfhCode as TrnCode" _
'     & ",OfhDate as TrnDate" _
'     & ",OfhPttCode as TrnPttCode" _
'     & ",OfhVtmCode as TrnVtmCode" _
'     & ",OfhVchNo as TrnVchNo" _
'     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdRefdHdr" _
'     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OfhCode > 0" _
'     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill payment
'If chkFByOutdXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Obl' as TrnType" _
'     & ",ObhCode as TrnCode" _
'     & ",ObphDate as TrnDate" _
'     & ",ObhPttCode as TrnPttCode" _
'     & ",ObhVtmCode as TrnVtmCode" _
'     & ",ObphVchNo as TrnVchNo" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlHdr" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObhCode > 0" _
'     & IIf(mQryPttCode > 0, " and ObhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Obfh' as TrnType" _
'     & ",ObfhCode as TrnCode" _
'     & ",ObfhDate as TrnDate" _
'     & ",ObfhPttCode as TrnPttCode" _
'     & ",ObfhVtmCode as TrnVtmCode" _
'     & ",ObfhVchNo as TrnVchNo" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode > 0" _
'     & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ipg' as TrnType" _
'     & ",IpgCode as TrnCode" _
'     & ",IpgDate as TrnDate" _
'     & ",IpgPttCode as TrnPttCode" _
'     & ",IpgVtmCode as TrnVtmCode" _
'     & ",IpgVchNo as TrnVchNo" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode > 0 and IpgAdvAmt > 0" _
'     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
If chkFByIndrBill.Value = vbChecked Then
End If
Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Iph' as TrnType" _
'     & ",IphCode as TrnCode" _
'     & ",IphDate as TrnDate" _
'     & ",IphPttCode as TrnPttCode" _
'     & ",IphVtmCode as TrnVtmCode" _
'     & ",IphVchNo as TrnVchNo" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode > 0" _
'     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ifh' as TrnType" _
'     & ",IfhCode as TrnCode" _
'     & ",IfhDate as TrnDate" _
'     & ",IfhPttCode as TrnPttCode" _
'     & ",IfhVtmCode as TrnVtmCode" _
'     & ",IfhVchNo as TrnVchNo" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode > 0" _
'     & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill payment
'If chkFByIndrXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ibph' as TrnType" _
'     & ",IbphCode as TrnCode" _
'     & ",IbphDate as TrnDate" _
'     & ",IbphPttCode as TrnPttCode" _
'     & ",IbphVtmCode as TrnVtmCode" _
'     & ",IbphVchNo as TrnVchNo" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode > 0" _
'     & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ibfh' as TrnType" _
'     & ",IbfhCode as TrnCode" _
'     & ",IbfhDate as TrnDate" _
'     & ",IbfhPttCode as TrnPttCode" _
'     & ",IbfhVtmCode as TrnVtmCode" _
'     & ",IbfhVchNo as TrnVchNo" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode > 0" _
'     & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Igt' as TrnType" _
'     & ",IgtCode as TrnCode" _
'     & ",IgtDate as TrnDate" _
'     & ",IgtPttCode as TrnPttCode" _
'     & ",IgtVtmCode as TrnVtmCode" _
'     & ",IgtVchNo as TrnVchNo" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode > 0" _
'     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Igf' as TrnType" _
'     & ",IgfCode as TrnCode" _
'     & ",IgfDate as TrnDate" _
'     & ",IgfPttCode as TrnPttCode" _
'     & ",IgfVtmCode as TrnVtmCode" _
'     & ",IgfVchNo as TrnVchNo" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode > 0" _
'     & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ") as t1"
mQryStr = mQryStr & " inner join PatMast on t1.TrnPttCode = PatMast.PttCode" _
 & " order by t1.TrnDate,t1.TrnType,t1.TrnCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub

Private Sub CreateExpandedSrmyList()
Dim mQryStr As String

clsListStru.AddFields mExpr:="tTrnSmryId", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="TrnType", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="TrnCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="VtmName", mTitle:="Voucher", mAlign:=1, mWidth:=2250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnVchNo", mTitle:="Vchr.No", mAlign:=7, mWidth:=1250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnDate", mTitle:="Date", mAlign:=1, mWidth:=1300, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="PttCode", mAttrib:=cFAT_SYSTEM
clsListStru.AddFields mExpr:="PttName", mTitle:="Patient Name", mAlign:=1, mWidth:=2500, mShowItem:=True
clsListStru.AddFields mExpr:="PttRegNo", mTitle:="Reg.No", mAlign:=7, mWidth:=1250, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="TrnSrvName", mTitle:="Service Name", mAlign:=1, mWidth:=2500, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="TrnAmtAftDisc", mTitle:="Recd.Amt", mAlign:=7, mWidth:=1250, mShowItem:=True
clsListStru.AddFields mExpr:="TrnDiscAmt", mTitle:="Discount", mAlign:=7, mWidth:=1250, mShowItem:=True
' --------------------------------------
clsListStru.AddFields mExpr:="PttRefName", mTitle:="Care of", mAlign:=1, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="PttAddr", mTitle:="Address", mAlign:=1, mWidth:=2000, mShowItem:=True
clsListStru.AddFields mExpr:="PatAraName", mTitle:="Area", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="PatStnName", mTitle:="Station", mAlign:=1, mWidth:=1500, mShowItem:=True
clsListStru.AddFields mExpr:="PatPcgName", mTitle:="Category", mAlign:=1, mWidth:=2000, mShowItem:=True

mQryStr = "Select *" _
 & ",format(TrnDate,'yyyymmdd')+TrnType+format(TrnCode,'" & CStr(cLONGCODESTRFMT) & "') as tTrnSmryId"
mQryStr = mQryStr & " from ("
Rem reserved query string producing no records
mQryStr = mQryStr & "Select " _
 & "'Opg' as TrnType" _
 & ",OpgCode as TrnCode" _
 & ",OpgDate as TrnDate" _
 & ",OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
 & ",OpgPttCode as TrnPttCode" _
 & ",OpgVtmCode as TrnVtmCode" _
 & ",OpgVchNo as TrnVchNo" _
 & ",OpgAmtAftDisc as TrnAmtAftDisc" _
 & ",OpgDiscAmt as TrnDiscAmt" _
 & " from OutdReg" _
 & " inner join ServMast on OutdReg.OpgSrvCode=ServMast.SrvCode" _
 & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
 & " and OpgCode>0 and True=False" _
 & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
 & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
 & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
 & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
Rem outdoor registration
If chkFByOutdReg.Value = vbChecked Then
    mQryStr = mQryStr & " UNION ALL "
    mQryStr = mQryStr & " Select " _
     & "'Opg' as TrnType" _
     & ",OpgCode as TrnCode" _
     & ",OpgDate as TrnDate" _
     & ",OpgSrvCode as TrnSrvCode,ServMast.SrvName as TrnSrvName" _
     & ",OpgPttCode as TrnPttCode" _
     & ",OpgVtmCode as TrnVtmCode" _
     & ",OpgVchNo as TrnVchNo" _
     & ",OpgAmtAftDisc as TrnAmtAftDisc" _
     & ",OpgDiscAmt as TrnDiscAmt" _
     & " from OutdReg" _
     & " inner join ServMast on OutdReg.OpgSrvCode=ServMast.SrvCode" _
     & " where OpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
     & " and OpgCode>0" _
     & IIf(mQryPttCode > 0, " and OpgPttCode=" & CStr(mQryPttCode), "") _
     & IIf(mQrySrvCode > 0, " and OpgSrvCode=" & CStr(mQrySrvCode), "") _
     & IIf(mQrySgpCode > 0, " and SrvSgpCode=" & CStr(mQrySgpCode), "") _
     & IIf(mQryVtmCode > 0, " and OpgVtmCode=" & CStr(mQryVtmCode), "")
End If
Rem outdoor receipt received amount
If chkFByOutdBill.Value = vbChecked Then
End If
Rem outdoor payment
'If chkFByOutdPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Oph' as TrnType" _
'     & ",OphCode as TrnCode" _
'     & ",OphDate as TrnDate" _
'     & ",OphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",OphPttCode as TrnPttCode" _
'     & ",OphVtmCode as TrnVtmCode" _
'     & ",OphVchNo as TrnVchNo" _
'     & ",OphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdPymtHdr" _
'     & " inner join VTypMast on OutdPymtHdr.OphVtmCode = VTypMast.VtmCode" _
'     & " where OphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OphCode>0" _
'     & IIf(mQryPttCode > 0, " and OphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OphVtmCode=" & CStr(mQryVtmCode), "")
'     Rem & ",-111 as TrnSrvCode,'Outdoor Rcpt Payment' as TrnSrvName"
'End If
Rem outdoor refund
'If chkFByOutdRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ofh' as TrnType" _
'     & ",OfhCode as TrnCode" _
'     & ",OfhDate as TrnDate" _
'     & ",OfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",OfhPttCode as TrnPttCode" _
'     & ",OfhVtmCode as TrnVtmCode" _
'     & ",OfhVchNo as TrnVchNo" _
'     & ",OfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdRefdHdr" _
'     & " inner join VTypMast on OutdRefdHdr.OfhVtmCode = VTypMast.VtmCode" _
'     & " where OfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and OfhCode>0" _
'     & IIf(mQryPttCode > 0, " and OfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and OfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill payment
'If chkFByOutdXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Obl' as TrnType" _
'     & ",ObhCode as TrnCode" _
'     & ",ObphDate as TrnDate" _
'     & ",ObhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObhPttCode as TrnPttCode" _
'     & ",ObhVtmCode as TrnVtmCode" _
'     & ",ObphVchNo as TrnVchNo" _
'     & ",ObphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlHdr" _
'     & " inner join VTypMast on OutdBlHdr.ObhVtmCode = VTypMast.VtmCode" _
'     & " where ObphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem outdoor bill refund
'If chkFByOutdBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Obfh' as TrnType" _
'     & ",ObfhCode as TrnCode" _
'     & ",ObfhDate as TrnDate" _
'     & ",ObfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",ObfhPttCode as TrnPttCode" _
'     & ",ObfhVtmCode as TrnVtmCode" _
'     & ",ObfhVchNo as TrnVchNo" _
'     & ",ObfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from OutdBlRefdHdr" _
'     & " inner join VTypMast on OutdBlRefdHdr.ObfhVtmCode = VTypMast.VtmCode" _
'     & " where ObfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and ObfhCode>0" _
'     & IIf(mQryPttCode > 0, " and ObfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and ObfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor advance ---------------------
'If chkFByIndrReg.Value = vbChecked = True Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ipg' as TrnType" _
'     & ",IpgCode as TrnCode" _
'     & ",IpgDate as TrnDate" _
'     & ",IpgVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IpgPttCode as TrnPttCode" _
'     & ",IpgVtmCode as TrnVtmCode" _
'     & ",IpgVchNo as TrnVchNo" _
'     & ",IpgAdvAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrReg" _
'     & " inner join VTypMast on IndrReg.IpgVtmCode = VTypMast.VtmCode" _
'     & " where IpgDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IpgCode>0" _
'     & IIf(mQryPttCode > 0, " and IpgPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IpgVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor receipt received amount
If chkFByIndrBill.Value = vbChecked Then
End If
Rem indoor payment
'If chkFByIndrPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Iph' as TrnType" _
'     & ",IphCode as TrnCode" _
'     & ",IphDate as TrnDate" _
'     & ",IphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IphPttCode as TrnPttCode" _
'     & ",IphVtmCode as TrnVtmCode" _
'     & ",IphVchNo as TrnVchNo" _
'     & ",IphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrPymtHdr" _
'     & " inner join VTypMast on IndrPymtHdr.IphVtmCode = VTypMast.VtmCode" _
'     & " where IphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IphCode>0" _
'     & IIf(mQryPttCode > 0, " and IphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor refund
'If chkFByIndrRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ifh' as TrnType" _
'     & ",IfhCode as TrnCode" _
'     & ",IfhDate as TrnDate" _
'     & ",IfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IfhPttCode as TrnPttCode" _
'     & ",IfhVtmCode as TrnVtmCode" _
'     & ",IfhVchNo as TrnVchNo" _
'     & ",IfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRefdHdr" _
'     & " inner join VTypMast on IndrRefdHdr.IfhVtmCode = VTypMast.VtmCode" _
'     & " where IfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill payment
'If chkFByIndrXXXBill.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ibph' as TrnType" _
'     & ",IbphCode as TrnCode" _
'     & ",IbphDate as TrnDate" _
'     & ",IbphVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbphPttCode as TrnPttCode" _
'     & ",IbphVtmCode as TrnVtmCode" _
'     & ",IbphVchNo as TrnVchNo" _
'     & ",IbphDepoAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlPymtHdr" _
'     & " inner join VTypMast on IndrBlPymtHdr.IbphVtmCode = VTypMast.VtmCode" _
'     & " where IbphDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbphCode>0" _
'     & IIf(mQryPttCode > 0, " and IbphPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbphVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor bill refund
'If chkFByIndrBlRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Ibfh' as TrnType" _
'     & ",IbfhCode as TrnCode" _
'     & ",IbfhDate as TrnDate" _
'     & ",IbfhVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IbfhPttCode as TrnPttCode" _
'     & ",IbfhVtmCode as TrnVtmCode" _
'     & ",IbfhVchNo as TrnVchNo" _
'     & ",IbfhRefuAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrBlRefdHdr" _
'     & " inner join VTypMast on IndrBlRefdHdr.IbfhVtmCode = VTypMast.VtmCode" _
'     & " where IbfhDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IbfhCode>0" _
'     & IIf(mQryPttCode > 0, " and IbfhPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IbfhVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c payment
'If chkFByIndrRgPymt.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Igt' as TrnType" _
'     & ",IgtCode as TrnCode" _
'     & ",IgtDate as TrnDate" _
'     & ",IgtVtmCode * -1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgtPttCode as TrnPttCode" _
'     & ",IgtVtmCode as TrnVtmCode" _
'     & ",IgtVchNo as TrnVchNo" _
'     & ",IgtDpogAmt as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgPymt" _
'     & " inner join VTypMast on IndrRgPymt.IgtVtmCode = VTypMast.VtmCode" _
'     & " where IgtDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgtCode>0" _
'     & IIf(mQryPttCode > 0, " and IgtPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgtVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem indoor on a/c refund
'If chkFByIndrRgRefd.Value = vbChecked Then
'    mQryStr = mQryStr & " UNION ALL "
'    mQryStr = mQryStr & " Select " _
'     & "'Igf' as TrnType" _
'     & ",IgfCode as TrnCode" _
'     & ",IgfDate as TrnDate" _
'     & ",IgfVtmCode * - 1 as TrnSrvCode,VTypMast.VtmName as TrnSrvName" _
'     & ",IgfPttCode as TrnPttCode" _
'     & ",IgfVtmCode as TrnVtmCode" _
'     & ",IgfVchNo as TrnVchNo" _
'     & ",IgfRfugAmt * -1 as TrnAmtAftDisc" _
'     & ",0 as TrnDiscAmt" _
'     & " from IndrRgRefd" _
'     & " inner join VTypMast on IndrRgRefd.IgfVtmCode = VTypMast.VtmCode" _
'     & " where IgfDate between #" & CStr(ToSysDate(Ctod(dtpFromDate.Text))) & "# and #" & CStr(ToSysDate(Ctod(dtpToDate.Text))) & "#" _
'     & " and IgfCode>0" _
'     & IIf(mQryPttCode > 0, " and IgfPttCode=" & CStr(mQryPttCode), "") _
'     & IIf(mQrySrvCode > 0, " and True=False", "") _
'     & IIf(mQrySgpCode > 0, " and True=False", "") _
'     & IIf(mQryVtmCode > 0, " and IgfVtmCode=" & CStr(mQryVtmCode), "")
'End If
Rem ----------------------------------
mQryStr = mQryStr & ") as t1"
mQryStr = mQryStr & " inner join PatMast on t1.TrnPttCode=PatMast.PttCode" _
 & " order by t1.TrnDate,t1.TrnType,t1.TrnCode"

datRecset.open mQryStr, dbComDatabase, adOpenKeyset, adLockReadOnly

End Sub


