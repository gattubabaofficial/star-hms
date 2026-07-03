from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from backend.database import get_db
from backend.models.accounts import AcntGrpMst, AchdMast, BnkrMast, NatioStateMast, VTypMast, Journal
from backend.schemas import (
    BankerCreate, BankerResponse,
    NationStateCreate, NationStateResponse,
    VoucherTypeCreate, VoucherTypeResponse,
    AccountGroupCreate, AccountGroupResponse,
    AccountLedgerCreate, AccountLedgerResponse,
    JournalCreate, JournalResponse,
)
from backend.core.dependencies import get_current_active_user

router = APIRouter()

# ─────────────────────────────────────────────────────────────────────────────
# Banker Master
# ─────────────────────────────────────────────────────────────────────────────
def _bkr_out(o): return {"bkr_code": o.BkrCode, "bkr_name": o.BkrName, "bkr_desc": o.BkrDesc, "bkr_rec_state": o.BkrRecState}

@router.post("/bankers", response_model=BankerResponse)
def create_banker(schema: BankerCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = BnkrMast(BkrName=schema.bkr_name, BkrDesc=schema.bkr_desc, BkrRecState=schema.bkr_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    return _bkr_out(obj)

@router.get("/bankers", response_model=List[BankerResponse])
def get_bankers(db: Session = Depends(get_db)):
    rows = db.query(BnkrMast).filter(BnkrMast.BkrRecState != 0).all()
    return [_bkr_out(o) for o in rows]

@router.put("/bankers/{code}", response_model=BankerResponse)
def update_banker(code: int, schema: BankerCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(BnkrMast).filter(BnkrMast.BkrCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.BkrName = schema.bkr_name; obj.BkrDesc = schema.bkr_desc; obj.BkrRecState = schema.bkr_rec_state or 1
    db.commit(); db.refresh(obj)
    return _bkr_out(obj)

@router.delete("/bankers/{code}")
def delete_banker(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(BnkrMast).filter(BnkrMast.BkrCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.BkrRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Nation/State Master
# ─────────────────────────────────────────────────────────────────────────────
def _nst_out(o): return {"nst_code": o.NstCode, "nst_name": o.NstName, "nst_ref_code": o.NstRefCode, "nst_rec_state": o.NstRecState}

@router.post("/nation-states", response_model=NationStateResponse)
def create_nation_state(schema: NationStateCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = NatioStateMast(NstName=schema.nst_name, NstRefCode=schema.nst_ref_code, NstRecState=schema.nst_rec_state or 1)
    db.add(obj); db.commit(); db.refresh(obj)
    return _nst_out(obj)

@router.get("/nation-states", response_model=List[NationStateResponse])
def get_nation_states(db: Session = Depends(get_db)):
    rows = db.query(NatioStateMast).filter(NatioStateMast.NstRecState != 0).all()
    return [_nst_out(o) for o in rows]

@router.put("/nation-states/{code}", response_model=NationStateResponse)
def update_nation_state(code: int, schema: NationStateCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(NatioStateMast).filter(NatioStateMast.NstCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.NstName = schema.nst_name; obj.NstRefCode = schema.nst_ref_code; obj.NstRecState = schema.nst_rec_state or 1
    db.commit(); db.refresh(obj)
    return _nst_out(obj)

@router.delete("/nation-states/{code}")
def delete_nation_state(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(NatioStateMast).filter(NatioStateMast.NstCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.NstRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Voucher Type Master
# ─────────────────────────────────────────────────────────────────────────────
def _vtm_out(o):
    return {
        "vtm_code": o.VtmCode, "vtm_name": o.VtmName, "vtm_abvr": o.VtmAbvr, "vtm_sys_code": o.VtmSysCode,
        "vtm_editable": o.VtmEditable, "vtm_prefix": o.VtmPrefix, "vtm_postfix": o.VtmPostfix,
        "vtm_itm_narr": o.VtmItmNarr, "vtm_com_narr": o.VtmComNarr, "vtm_start_no": o.VtmStartNo,
        "vtm_reset_no_basis": o.VtmResetNoBasis, "vtm_index": o.VtmIndex, "vtm_show_in_list": o.VtmShowInList,
        "vtm_rec_state": o.VtmRecState, "vtm_prnt_name": o.VtmPrntName, "vtm_prnt_copies": o.VtmPrntCopies,
        "vtm_pymt_mode": o.VtmPymtMode, "vtm_prnt_fmt_speci": o.VtmPrntFmtSpeci, "vtm_stk_mode": o.VtmStkMode,
        "vtm_send_sms_nos": o.VtmSendSmsNos, "vtm_add_new_sms": o.VtmAddNewSMS, "vtm_edit_sms": o.VtmEditSMS,
        "vtm_dele_sms": o.VtmDeleSMS, "vtm_no_dues": o.VtmNoDues,
    }

def _apply_vtm(obj, schema: VoucherTypeCreate):
    obj.VtmName = schema.vtm_name; obj.VtmAbvr = schema.vtm_abvr; obj.VtmSysCode = schema.vtm_sys_code
    obj.VtmEditable = schema.vtm_editable if schema.vtm_editable is not None else True
    obj.VtmPrefix = schema.vtm_prefix; obj.VtmPostfix = schema.vtm_postfix
    obj.VtmItmNarr = schema.vtm_itm_narr; obj.VtmComNarr = schema.vtm_com_narr
    obj.VtmStartNo = schema.vtm_start_no; obj.VtmResetNoBasis = schema.vtm_reset_no_basis
    obj.VtmIndex = schema.vtm_index
    obj.VtmShowInList = schema.vtm_show_in_list if schema.vtm_show_in_list is not None else True
    obj.VtmRecState = schema.vtm_rec_state or 1
    obj.VtmPrntName = schema.vtm_prnt_name; obj.VtmPrntCopies = schema.vtm_prnt_copies
    obj.VtmPymtMode = schema.vtm_pymt_mode; obj.VtmPrntFmtSpeci = schema.vtm_prnt_fmt_speci
    obj.VtmStkMode = schema.vtm_stk_mode; obj.VtmSendSmsNos = schema.vtm_send_sms_nos
    obj.VtmAddNewSMS = schema.vtm_add_new_sms or False
    obj.VtmEditSMS = schema.vtm_edit_sms or False
    obj.VtmDeleSMS = schema.vtm_dele_sms or False
    obj.VtmNoDues = schema.vtm_no_dues or False

@router.post("/voucher-types", response_model=VoucherTypeResponse)
def create_voucher_type(schema: VoucherTypeCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = VTypMast()
    _apply_vtm(obj, schema)
    db.add(obj); db.commit(); db.refresh(obj)
    return _vtm_out(obj)

@router.get("/voucher-types", response_model=List[VoucherTypeResponse])
def get_voucher_types(db: Session = Depends(get_db)):
    rows = db.query(VTypMast).filter(VTypMast.VtmRecState != 0).all()
    return [_vtm_out(o) for o in rows]

@router.put("/voucher-types/{code}", response_model=VoucherTypeResponse)
def update_voucher_type(code: int, schema: VoucherTypeCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(VTypMast).filter(VTypMast.VtmCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    _apply_vtm(obj, schema)
    db.commit(); db.refresh(obj)
    return _vtm_out(obj)

@router.delete("/voucher-types/{code}")
def delete_voucher_type(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(VTypMast).filter(VTypMast.VtmCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.VtmRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Account Group Master
# ─────────────────────────────────────────────────────────────────────────────
def _acg_out(o, parent=None):
    return {
        "acg_code": o.AcgCode, "acg_name": o.AcgName, "acg_abvr": o.AcgAbvr, "acg_sys_code": o.AcgSysCode,
        "acg_base_code": o.AcgBaseCode, "acg_index": o.AcgIndex, "acg_depends": o.AcgDepends,
        "acg_rec_state": o.AcgRecState, "parent_name": parent.AcgName if parent else None,
    }

@router.post("/account-groups", response_model=AccountGroupResponse)
def create_account_group(schema: AccountGroupCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = AcntGrpMst(
        AcgName=schema.acg_name, AcgAbvr=schema.acg_abvr, AcgSysCode=schema.acg_sys_code,
        AcgBaseCode=schema.acg_base_code, AcgIndex=schema.acg_index, AcgDepends=schema.acg_depends,
        AcgRecState=schema.acg_rec_state or 1,
    )
    db.add(obj); db.commit(); db.refresh(obj)
    if obj.AcgDepends == obj.AcgCode:
        db.delete(obj); db.commit()
        raise HTTPException(400, "Account Group cannot depend on itself")
    parent = db.query(AcntGrpMst).filter(AcntGrpMst.AcgCode == obj.AcgDepends).first() if obj.AcgDepends else None
    return _acg_out(obj, parent)

@router.get("/account-groups", response_model=List[AccountGroupResponse])
def get_account_groups(db: Session = Depends(get_db)):
    rows = db.query(AcntGrpMst).filter(AcntGrpMst.AcgRecState != 0).all()
    result = []
    for o in rows:
        parent = db.query(AcntGrpMst).filter(AcntGrpMst.AcgCode == o.AcgDepends).first() if o.AcgDepends else None
        result.append(_acg_out(o, parent))
    return result

@router.put("/account-groups/{code}", response_model=AccountGroupResponse)
def update_account_group(code: int, schema: AccountGroupCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(AcntGrpMst).filter(AcntGrpMst.AcgCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    if schema.acg_depends == code:
        raise HTTPException(400, "Account Group cannot depend on itself")
    obj.AcgName = schema.acg_name; obj.AcgAbvr = schema.acg_abvr; obj.AcgSysCode = schema.acg_sys_code
    obj.AcgBaseCode = schema.acg_base_code; obj.AcgIndex = schema.acg_index; obj.AcgDepends = schema.acg_depends
    obj.AcgRecState = schema.acg_rec_state or 1
    db.commit(); db.refresh(obj)
    parent = db.query(AcntGrpMst).filter(AcntGrpMst.AcgCode == obj.AcgDepends).first() if obj.AcgDepends else None
    return _acg_out(obj, parent)

@router.delete("/account-groups/{code}")
def delete_account_group(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(AcntGrpMst).filter(AcntGrpMst.AcgCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.AcgRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Account Ledger (Head) Master
# ─────────────────────────────────────────────────────────────────────────────
def _ah_out(o, group=None, parent=None):
    return {
        "ah_code": o.AhCode, "ah_name": o.AhName, "ah_depends": o.AhDepends, "ah_rec_state": o.AhRecState,
        "ah_acg_code": o.AhAcgCode, "group_name": group.AcgName if group else None,
        "parent_name": parent.AhName if parent else None,
    }

@router.post("/account-ledgers", response_model=AccountLedgerResponse)
def create_account_ledger(schema: AccountLedgerCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = AchdMast(
        AhName=schema.ah_name, AhDepends=schema.ah_depends, AhRecState=schema.ah_rec_state or 1,
        AhAcgCode=schema.ah_acg_code,
    )
    db.add(obj); db.commit(); db.refresh(obj)
    if obj.AhDepends == obj.AhCode:
        db.delete(obj); db.commit()
        raise HTTPException(400, "Account Ledger cannot depend on itself")
    group = db.query(AcntGrpMst).filter(AcntGrpMst.AcgCode == obj.AhAcgCode).first() if obj.AhAcgCode else None
    parent = db.query(AchdMast).filter(AchdMast.AhCode == obj.AhDepends).first() if obj.AhDepends else None
    return _ah_out(obj, group, parent)

@router.get("/account-ledgers", response_model=List[AccountLedgerResponse])
def get_account_ledgers(db: Session = Depends(get_db)):
    rows = db.query(AchdMast).filter(AchdMast.AhRecState != 0).all()
    result = []
    for o in rows:
        group = db.query(AcntGrpMst).filter(AcntGrpMst.AcgCode == o.AhAcgCode).first() if o.AhAcgCode else None
        parent = db.query(AchdMast).filter(AchdMast.AhCode == o.AhDepends).first() if o.AhDepends else None
        result.append(_ah_out(o, group, parent))
    return result

@router.put("/account-ledgers/{code}", response_model=AccountLedgerResponse)
def update_account_ledger(code: int, schema: AccountLedgerCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(AchdMast).filter(AchdMast.AhCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    if schema.ah_depends == code:
        raise HTTPException(400, "Account Ledger cannot depend on itself")
    obj.AhName = schema.ah_name; obj.AhDepends = schema.ah_depends; obj.AhRecState = schema.ah_rec_state or 1
    obj.AhAcgCode = schema.ah_acg_code
    db.commit(); db.refresh(obj)
    group = db.query(AcntGrpMst).filter(AcntGrpMst.AcgCode == obj.AhAcgCode).first() if obj.AhAcgCode else None
    parent = db.query(AchdMast).filter(AchdMast.AhCode == obj.AhDepends).first() if obj.AhDepends else None
    return _ah_out(obj, group, parent)

@router.delete("/account-ledgers/{code}")
def delete_account_ledger(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(AchdMast).filter(AchdMast.AhCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.AhRecState = 0; db.commit(); return {"ok": True}

# ─────────────────────────────────────────────────────────────────────────────
# Journal (2-leg journal voucher entries)
# ─────────────────────────────────────────────────────────────────────────────
def _jrn_out(o, vtm=None, debit=None, credit=None):
    return {
        "jrn_code": o.JrnCode, "jrn_vtm_code": o.JrnVtmCode, "jrn_date": o.JrnDate, "jrn_ah_code": o.JrnAhCode,
        "jrn_amt": o.JrnAmt, "jrn_narr": o.JrnNarr, "jrn_l_ah_code": o.JrnLAhCode, "jrn_rec_state": o.JrnRecState,
        "jrn_icode": o.JrnICode, "jrn_sno": o.JrnSno, "jrn_prefix": o.JrnPrefix, "jrn_vch_no": o.JrnVchNo,
        "jrn_postfix": o.JrnPostfix, "jrn_cmp_code": o.JrnCmpCode, "jrn_auto_gen": o.JrnAutoGen,
        "voucher_type_name": vtm.VtmName if vtm else None,
        "debit_head_name": debit.AhName if debit else None,
        "credit_head_name": credit.AhName if credit else None,
    }

def _related_jrn(db: Session, o: Journal):
    vtm = db.query(VTypMast).filter(VTypMast.VtmCode == o.JrnVtmCode).first() if o.JrnVtmCode else None
    debit = db.query(AchdMast).filter(AchdMast.AhCode == o.JrnAhCode).first() if o.JrnAhCode else None
    credit = db.query(AchdMast).filter(AchdMast.AhCode == o.JrnLAhCode).first() if o.JrnLAhCode else None
    return vtm, debit, credit

@router.post("/journals", response_model=JournalResponse)
def create_journal(schema: JournalCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    if schema.jrn_ah_code == schema.jrn_l_ah_code:
        raise HTTPException(400, "Debit and credit account heads must differ")
    vtm = db.query(VTypMast).filter(VTypMast.VtmCode == schema.jrn_vtm_code).first() if schema.jrn_vtm_code else None
    obj = Journal(
        JrnICode=0, JrnSno=1, JrnVtmCode=schema.jrn_vtm_code,
        JrnPrefix=vtm.VtmPrefix if vtm else None, JrnPostfix=vtm.VtmPostfix if vtm else None,
        JrnDate=schema.jrn_date, JrnAhCode=schema.jrn_ah_code, JrnAmt=schema.jrn_amt,
        JrnNarr=schema.jrn_narr, JrnLAhCode=schema.jrn_l_ah_code, JrnCmpCode=None,
        JrnAutoGen=False, JrnRecState=schema.jrn_rec_state or 1,
    )
    db.add(obj); db.commit(); db.refresh(obj)
    vtm, debit, credit = _related_jrn(db, obj)
    return _jrn_out(obj, vtm, debit, credit)

@router.get("/journals", response_model=List[JournalResponse])
def get_journals(db: Session = Depends(get_db)):
    rows = db.query(Journal).filter(Journal.JrnRecState != 0).order_by(Journal.JrnCode.desc()).all()
    result = []
    for o in rows:
        vtm, debit, credit = _related_jrn(db, o)
        result.append(_jrn_out(o, vtm, debit, credit))
    return result

@router.put("/journals/{code}", response_model=JournalResponse)
def update_journal(code: int, schema: JournalCreate, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    if schema.jrn_ah_code == schema.jrn_l_ah_code:
        raise HTTPException(400, "Debit and credit account heads must differ")
    obj = db.query(Journal).filter(Journal.JrnCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.JrnVtmCode = schema.jrn_vtm_code; obj.JrnDate = schema.jrn_date; obj.JrnAhCode = schema.jrn_ah_code
    obj.JrnAmt = schema.jrn_amt; obj.JrnNarr = schema.jrn_narr; obj.JrnLAhCode = schema.jrn_l_ah_code
    obj.JrnRecState = schema.jrn_rec_state or 1
    db.commit(); db.refresh(obj)
    vtm, debit, credit = _related_jrn(db, obj)
    return _jrn_out(obj, vtm, debit, credit)

@router.delete("/journals/{code}")
def delete_journal(code: int, db: Session = Depends(get_db), current_user=Depends(get_current_active_user)):
    obj = db.query(Journal).filter(Journal.JrnCode == code).first()
    if not obj: raise HTTPException(404, "Not found")
    obj.JrnRecState = 0; db.commit(); return {"ok": True}
