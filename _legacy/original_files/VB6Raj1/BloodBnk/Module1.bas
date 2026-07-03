Attribute VB_Name = "Module1"
Option Explicit

Private Sub xyz()

Rem blood make header variables
Public mBkhStkCode_lng As Long, mBkhTime_lng As Long, mBkhTime_str As String, mBkhTrnRefNo_str As String, mBkhTrnRefDt_dt As Date, mBkhBinPckQty_dbl As Double, mBkhBinBldQty_dbl As Double, mBkhBouPckQty_dbl As Double, mBkhBouBldQty_dbl As Double, mBkhRemark_str As String
Rem blood make detail variables
Public mBmkStkCode_lng As Long, mBmkStkICode_lng As Long, mBmkItmCode_lng As Long, mBmkBldCode_lng As Long, mBmkBdgCode_lng As Long, mBmkBdcCode_lng As Long, mBmkBdpCode_lng As Long, mBmkItrCode_lng As Long, mBmkBldRefNo_str As String, mBmkEttCode_lng As Long, mBmkEfmCode_lng As Long, mBmkHpmCode_lng As Long, mBmkBinCode_lng As Long, mBmkBinICode_lng As Long, mBmkBouCode_lng As Long, mBmkBouICode_lng As Long, mBmkNarr_str As String, mBmkPckQty_dbl As Double, mBmkBldQty_dbl As Double, mBmkRemark_str As String




    ElseIf blnBloodMakeTran = True Then
        mBkhStkCode_lng = .fields("BkhStkCode")
        mBkhTime_lng = .fields("BkhTime")
        mBkhTime_str = MinToTime(.fields("BkhTime"))
        mBkhTrnRefNo_str = .fields("BkhTrnRefNo")
        mBkhTrnRefDt_dt = .fields("BkhTrnRefDt")
        mBkhBinPckQty_dbl = .fields("BkhBinPckQty")
        mBkhBinBldQty_dbl = .fields("BkhBinBldQty")
        mBkhBouPckQty_dbl = .fields("BkhBouPckQty")
        mBkhBouBldQty_dbl = .fields("BkhBouBldQty")
        mBkhRemark_str = .fields("BkhRemark")


    ElseIf blnBloodMakeTran = True Then
        mBmkStkCode_lng = .fields("BmkStkCode")
        mBmkStkICode_lng = .fields("BmkStkICode")
        mBmkEttCode_lng = .fields("BmkEttCode")
        mBmkEfmCode_lng = .fields("BmkEfmCode")
        mBmkHpmCode_lng = .fields("BmkHpmCode")
        mBmkItmCode_lng = .fields("BmkItmCode")
        mBmkBldCode_lng = .fields("BmkBldCode")
        mBmkBdgCode_lng = .fields("BmkBdgCode")
        mBmkBdcCode_lng = .fields("BmkBdcCode")
        mBmkBdpCode_lng = .fields("BmkBdpCode")
        mBmkItrCode_lng = .fields("BmkItrCode")
        mBmkBldRefNo_str = .fields("BmkBldRefNo")
        mBmkBinCode_lng = .fields("BmkBinCode")
        mBmkBinICode_lng = .fields("BmkBinICode")
        mBmkBouCode_lng = .fields("BmkBouCode")
        mBmkBouICode_lng = .fields("BmkBouICode")
        mBmkNarr_str = .fields("BmkNarr")
        mBmkPckQty_dbl = .fields("BmkPckQty")
        mBmkBldQty_dbl = .fields("BmkBldQty")
        mBmkRemark_str = .fields("BmkRemark")


ElseIf blnBloodMakeTran = True Then
    mBkhStkCode_lng = 0
    mBkhTime_lng = 0
    mBkhTime_str = ""
    mBkhTrnRefNo_str = ""
    mBkhTrnRefDt_dt = cUNKNOWNDATE
    mBkhBinPckQty_dbl = 0
    mBkhBinBldQty_dbl = 0
    mBkhBouPckQty_dbl = 0
    mBkhBouBldQty_dbl = 0
    mBkhRemark_str = ""



ElseIf blnBloodMakeTran = True Then
    mBmkStkCode_lng = 0
    mBmkStkICode_lng = 0
    mBmkEttCode_lng = 0
    mBmkEfmCode_lng = 0
    mBmkHpmCode_lng = 0
    mBmkItmCode_lng = 0
    mBmkBldCode_lng = 0
    mBmkBdgCode_lng = 0
    mBmkBdcCode_lng = 0
    mBmkBdpCode_lng = 0
    mBmkItrCode_lng = 0
    mBmkBldRefNo_str = ""
    mBmkBinCode_lng = 0
    mBmkBinICode_lng = 0
    mBmkBouCode_lng = 0
    mBmkBouICode_lng = 0
    mBmkNarr_str = ""
    mBmkPckQty_dbl = 0
    mBmkBldQty_dbl = 0
    mBmkRemark_str = ""



            ElseIf blnBloodMakeTran = True Then
                If .fields("BmkStkCode") <> mBkhStkCode_lng Then
                    .fields("BmkStkCode") = mBkhStkCode_lng
                End If



            ElseIf blnBloodMakeTran = True Then
                .fields("BkhStkCode") = t2Recset.fields("BkhStkCode")
                .fields("BkhTime") = t2Recset.fields("BkhTime")
                .fields("BkhTrnRefNo") = t2Recset.fields("BkhTrnRefNo")
                .fields("BkhTrnRefDt") = t2Recset.fields("BkhTrnRefDt")
                .fields("BkhBinPckQty") = t2Recset.fields("BkhBinPckQty")
                .fields("BkhBinBldQty") = t2Recset.fields("BkhBinBldQty")
                .fields("BkhBouPckQty") = t2Recset.fields("BkhBouPckQty")
                .fields("BkhBouBldQty") = t2Recset.fields("BkhBouBldQty")
                .fields("BkhRemark") = t2Recset.fields("BkhRemark")



            ElseIf blnBloodMakeTran = True Then
                .fields("BmkStkCode") = t2Recset.fields("BmkStkCode")
                .fields("BmkStkICode") = t2Recset.fields("BmkStkICode")
                .fields("BmkEttCode") = t2Recset.fields("BmkEttCode")
                .fields("BmkEfmCode") = t2Recset.fields("BmkEfmCode")
                .fields("BmkHpmCode") = t2Recset.fields("BmkHpmCode")
                .fields("BmkItmCode") = t2Recset.fields("BmkItmCode")
                .fields("BmkBldCode") = t2Recset.fields("BmkBldCode")
                .fields("BmkBdgCode") = t2Recset.fields("BmkBdgCode")
                .fields("BmkBdcCode") = t2Recset.fields("BmkBdcCode")
                .fields("BmkBdpCode") = t2Recset.fields("BmkBdpCode")
                .fields("BmkItrCode") = t2Recset.fields("BmkItrCode")
                .fields("BmkBldRefNo") = t2Recset.fields("BmkBldRefNo")
                .fields("BmkBinCode") = t2Recset.fields("BmkBinCode")
                .fields("BmkBinICode") = t2Recset.fields("BmkBinICode")
                .fields("BmkBouCode") = t2Recset.fields("BmkBouCode")
                .fields("BmkBouICode") = t2Recset.fields("BmkBouICode")
                .fields("BmkNarr") = t2Recset.fields("BmkNarr")
                .fields("BmkPckQty") = t2Recset.fields("BmkPckQty")
                .fields("BmkBldQty") = t2Recset.fields("BmkBldQty")
                .fields("BmkRemark") = t2Recset.fields("BmkRemark")




ElseIf blnBloodMakeTran = True Then
    .fields("BkhStkCode") = mBkhStkCode_lng
    .fields("BkhTime") = mBkhTime_lng
    .fields("BkhTrnRefNo") = mBkhTrnRefNo_str
    .fields("BkhTrnRefDt") = mBkhTrnRefDt_dt
    .fields("BkhBinPckQty") = mBkhBinPckQty_dbl
    .fields("BkhBinBldQty") = mBkhBinBldQty_dbl
    .fields("BkhBouPckQty") = mBkhBouPckQty_dbl
    .fields("BkhBouBldQty") = mBkhBouBldQty_dbl
    .fields("BkhRemark") = mBkhRemark_str




ElseIf blnBloodMakeTran = True Then
    .fields("BmkStkCode") = mBmkStkCode_lng
    .fields("BmkStkICode") = mBmkStkICode_lng
    .fields("BmkEttCode") = mBmkEttCode_lng
    .fields("BmkEfmCode") = mBmkEfmCode_lng
    .fields("BmkHpmCode") = mBmkHpmCode_lng
    .fields("BmkItmCode") = mBmkItmCode_lng
    .fields("BmkBldCode") = mBmkBldCode_lng
    .fields("BmkBdgCode") = mBmkBdgCode_lng
    .fields("BmkBdcCode") = mBmkBdcCode_lng
    .fields("BmkBdpCode") = mBmkBdpCode_lng
    .fields("BmkItrCode") = mBmkItrCode_lng
    .fields("BmkBldRefNo") = mBmkBldRefNo_str
    .fields("BmkBinCode") = mBmkBinCode_lng
    .fields("BmkBinICode") = mBmkBinICode_lng
    .fields("BmkBouCode") = mBmkBouCode_lng
    .fields("BmkBouICode") = mBmkBouICode_lng
    .fields("BmkNarr") = mBmkNarr_str
    .fields("BmkPckQty") = mBmkPckQty_dbl
    .fields("BmkBldQty") = mBmkBldQty_dbl
    .fields("BmkRemark") = mBmkRemark_str



ElseIf blnBloodMakeTran = True Then
    .fields("BkhStkCode") = mBkhStkCode_lng
    .fields("BkhTime") = mBkhTime_lng
    .fields("BkhTrnRefNo") = mBkhTrnRefNo_str
    .fields("BkhTrnRefDt") = mBkhTrnRefDt_dt
    .fields("BkhBinPckQty") = mBkhBinPckQty_dbl
    .fields("BkhBinBldQty") = mBkhBinBldQty_dbl
    .fields("BkhBouPckQty") = mBkhBouPckQty_dbl
    .fields("BkhBouBldQty") = mBkhBouBldQty_dbl
    .fields("BkhRemark") = mBkhRemark_str



ElseIf blnBloodMakeTran = True Then
    .fields("BmkStkCode") = mBmkStkCode_lng
    .fields("BmkStkICode") = mBmkStkICode_lng
    .fields("BmkEttCode") = mBmkEttCode_lng
    .fields("BmkEfmCode") = mBmkEfmCode_lng
    .fields("BmkHpmCode") = mBmkHpmCode_lng
    .fields("BmkItmCode") = mBmkItmCode_lng
    .fields("BmkBldCode") = mBmkBldCode_lng
    .fields("BmkBdgCode") = mBmkBdgCode_lng
    .fields("BmkBdcCode") = mBmkBdcCode_lng
    .fields("BmkBdpCode") = mBmkBdpCode_lng
    .fields("BmkItrCode") = mBmkItrCode_lng
    .fields("BmkBldRefNo") = mBmkBldRefNo_str
    .fields("BmkBinCode") = mBmkBinCode_lng
    .fields("BmkBinICode") = mBmkBinICode_lng
    .fields("BmkBouCode") = mBmkBouCode_lng
    .fields("BmkBouICode") = mBmkBouICode_lng
    .fields("BmkNarr") = mBmkNarr_str
    .fields("BmkPckQty") = mBmkPckQty_dbl
    .fields("BmkBldQty") = mBmkBldQty_dbl
    .fields("BmkRemark") = mBmkRemark_str



ElseIf blnBloodMakeTran = True Then
    Rem nothing




End Sub
