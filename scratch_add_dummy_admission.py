import datetime
from backend.database import SessionLocal
from backend.models.ipd import (
    IndrReg, IBedState, IndrRgPymt, IndrRgRefd, IndrBlHdr, IndrBlPymtHdr, IndrBlRefdHdr, IndrHdr, IndrPymtHdr, IndrRefdHdr
)
from backend.models.masters import (
    BedMast, PatMast, DoctMast, AreaMast, StsnMast, PatCatgMst, FloorMast, WardMast
)

db = SessionLocal()

try:
    print("Cleaning existing transactions...")
    # Delete child transactions first
    db.query(IndrBlRefdHdr).delete()
    db.query(IndrBlPymtHdr).delete()
    db.query(IndrBlHdr).delete()
    db.query(IndrRefdHdr).delete()
    db.query(IndrPymtHdr).delete()
    db.query(IndrHdr).delete()
    db.query(IndrRgRefd).delete()
    db.query(IndrRgPymt).delete()
    db.query(IBedState).delete()
    db.query(IndrReg).delete()
    db.commit()
    print("Cleaned successfully.")

    # 1. Ensure Masters exist
    print("Seeding master tables...")
    stn = db.query(StsnMast).filter(StsnMast.StnCode == 1).first()
    if not stn:
        stn = StsnMast(StnCode=1, StnName='Downtown Station', StnShowInList=True, StnRecState=1)
        db.add(stn)
        db.commit()

    ara = db.query(AreaMast).filter(AreaMast.AraCode == 1).first()
    if not ara:
        ara = AreaMast(AraCode=1, AraName='North Wing', AraStnCode=1, AraRecState=1)
        db.add(ara)
        db.commit()

    pcg = db.query(PatCatgMst).filter(PatCatgMst.PcgCode == 1).first()
    if not pcg:
        pcg = PatCatgMst(PcgCode=1, PcgName='General Scheme', PcgInfAllowed=True, PcgDefAllowed=True, PcgDiscAllowed=True, PcgDiscPer=10.0, PcgShowInList=True, PcgRecState=1)
        db.add(pcg)
        db.commit()

    flr = db.query(FloorMast).filter(FloorMast.FlrCode == 1).first()
    if not flr:
        flr = FloorMast(FlrCode=1, FlrName='First Floor', FlrShowInList=True, FlrRecState=1)
        db.add(flr)
        db.commit()

    wrd = db.query(WardMast).filter(WardMast.WrdCode == 1).first()
    if not wrd:
        wrd = WardMast(WrdCode=1, WrdName='General Ward', WrdShowInList=True, WrdRecState=1)
        db.add(wrd)
        db.commit()

    # Bed 1
    bed_a = db.query(BedMast).filter(BedMast.BdmCode == 1).first()
    if not bed_a:
        bed_a = BedMast(BdmCode=1, BdmName='Bed 402A', BdmWrdCode=1, BdmFlrCode=1, BdmCharges=1500.00, BdmRecState=1)
        db.add(bed_a)
    else:
        bed_a.BdmCharges = 1500.00
        
    # Bed 2
    bed_b = db.query(BedMast).filter(BedMast.BdmCode == 2).first()
    if not bed_b:
        bed_b = BedMast(BdmCode=2, BdmName='Bed 402B', BdmWrdCode=1, BdmFlrCode=1, BdmCharges=1800.00, BdmRecState=1)
        db.add(bed_b)
    else:
        bed_b.BdmCharges = 1800.00

    dct = db.query(DoctMast).filter(DoctMast.DctCode == 1).first()
    if not dct:
        dct = DoctMast(DctCode=1, DctTitle='Dr.', DctName='Stephen Strange', DctSpeci='Neurosurgery', DctRecState=1)
        db.add(dct)

    # 2. Inpatient Patient
    ptt = db.query(PatMast).filter(PatMast.PttCode == 1).first()
    if not ptt:
        ptt = PatMast(
            PttCode=1, PttName='John Doe', PttRegNo=1001, PttRegDate=datetime.date(2026, 1, 1),
            PttPcgCode=1, PttSex='M', PttDob=datetime.date(1985, 5, 15), PttRefRela='Father',
            PttRefName='Richard Doe', PttAddr='123 Main St, Apt 4B', PttAraCode=1, PttStnCode=1,
            PttTelNo='555-0199', PttSMSNo='555-0199', PttEmail='john@example.com', PttRecState=1
        )
        db.add(ptt)
    db.commit()
    print("Masters seeded successfully.")

    # 3. Create Admission Stays (IndrReg)
    print("Seeding IPD stay records...")
    adm = IndrReg(
        IpgVtmCode=1, IpgPrefix='IPD', IpgVchNo=12345, IpgPostfix='',
        IpgDate=datetime.date(2026, 6, 17), IpgTime=750, # 12:30 PM
        IpgCDctCode=1, IpgPttCode=1, IpgBdmCode=2, IpgAdvAmt=5000.00,
        IpgRemark='Admitted for Neuro Observation', IpgRecState=1, IpgCmpCode=1
    )
    db.add(adm)
    db.commit()
    db.refresh(adm)
    ihr_code = adm.IpgCode

    # 3.1 Create stay header (IndrHdr)
    ihd = IndrHdr(
        IhdCode=ihr_code, IhdVtmCode=1, IhdPrefix='IPD', IhdVchNo=12345,
        IhdDate=datetime.date(2026, 6, 17), IhdTime=750, IhdPttCode=1,
        IhdCDctCode=1, IhdBedCode=2, IhdWrdCode=1, IhdFlrCode=1,
        IhdAdvAmt=5000.00, IhdStatus='Admitted', IhdRemark='Neuro Observation stay',
        IhdRecState=1, IhdCmpCode=1, IhdIpgCode=ihr_code
    )
    db.add(ihd)
    db.commit()

    # 4. Create Bed History Logs (IBedState)
    # Stay 1: Bed 402A from 2026-06-17 to 2026-06-19 (Shifted)
    ibs1 = IBedState(
        IbsSno=1, IbsVtmCode=1, IbsPrefix='IBS', IbsVchNo=101, IbsPostfix='',
        IbsDate=datetime.date(2026, 6, 17), IbsTime=750, IbsIpgCode=ihr_code,
        IbsBdmCode=1, IbsDischDate=datetime.date(2026, 6, 19), IbsDischTime=600, # 10:00 AM
        IbsPttCode=1, IbsDischState=2, IbsLIbsCode=0,
        IbsRemark='Initial Ward Placement', IbsRecState=1, IbsCmpCode=1
    )
    db.add(ibs1)
    db.commit()
    db.refresh(ibs1)

    # Stay 2: Bed 402B from 2026-06-19 (Occupied)
    ibs2 = IBedState(
        IbsSno=2, IbsVtmCode=1, IbsPrefix='IBS', IbsVchNo=102, IbsPostfix='',
        IbsDate=datetime.date(2026, 6, 19), IbsTime=600, IbsIpgCode=ihr_code,
        IbsBdmCode=2, IbsPttCode=1, IbsDischState=1,
        IbsRemark='Shifted to Room bed for observation', IbsRecState=1, IbsCmpCode=1
    )
    db.add(ibs2)
    db.commit()
    db.refresh(ibs2)

    # Link Bed 1 next bed code to Bed 2
    ibs1.IbsLIbsCode = ibs2.IbsCode
    db.commit()

    # 5. Seed Ledger financial records
    # 5.1 Indoor Receipt Charges (2026-06-18) - seeded into IndrBlHdr
    rec = IndrBlHdr(
        IbhVtmCode=2, IbhPrefix='IRC', IbhVchNo=20001, IbhDate=datetime.date(2026, 6, 18),
        IbhIhdCode=ihr_code, IbhPttCode=1, IbhBillType='Indoor Charges',
        IbhDiscPer=4.0, IbhTotalAmt=2500.00, IbhDepAmt=0.0, IbhRfugAmt=0.0, IbhBalAmt=2400.00,
        IbhStatus='Unpaid', IbhRemark='Diagnostics procedures charges', IbhRecState=1, IbhCmpCode=1
    )
    db.add(rec)
    db.commit()
    db.refresh(rec)

    # 5.2 Receipt payment collected for the receipt charges (2026-06-18)
    rp = IndrPymtHdr(
        IphIpgCode=ihr_code, IphPttCode=1, IphVtmCode=3, IphPrefix='IPY', IphVchNo=30001,
        IphDate=datetime.date(2026, 6, 18), IphTime=850,
        IphDepoAmt=2400.00, IphRemark='UPI transaction collection', IphRecState=1, IphCmpCode=1
    )
    db.add(rp)

    # 5.3 On-account deposit advance (2026-06-20)
    oa = IndrRgPymt(
        IgtIpgCode=ihr_code, IgtPttCode=1, IgtVtmCode=8, IgtPrefix='ADV', IgtVchNo=80001,
        IgtDate=datetime.date(2026, 6, 20), IgtTime=660,
        IgtDpogAmt=1500.00, IgtRemark='Pre-Discharge Security Deposit', IgtRecState=1, IgtCmpCode=1
    )
    db.add(oa)

    # 5.4 Daily Stay Room Bill Charge (2026-06-20)
    bill = IndrBlHdr(
        IbhVtmCode=5, IbhPrefix='BL', IbhVchNo=50001, IbhDate=datetime.date(2026, 6, 20),
        IbhIhdCode=ihr_code, IbhPttCode=1, IbhBillType='Final Bill',
        IbhDiscPer=0.0, IbhTotalAmt=3000.00, IbhDepAmt=0.0, IbhRfugAmt=0.0, IbhBalAmt=3000.00,
        IbhStatus='Unpaid', IbhRemark='2 days ward room charges', IbhRecState=1, IbhCmpCode=1
    )
    db.add(bill)
    db.commit()

    # 5.5 Final Bill Payment Settlement (2026-06-21)
    settle = IndrBlPymtHdr(
        IbphIpgCode=ihr_code, IbphPttCode=1, IbphVtmCode=6, IbphPrefix='SPY', IbphVchNo=60001,
        IbphDate=datetime.date(2026, 6, 21), IbphTime=720,
        IbphDepoAmt=3100.00, IbphRemark='Final cash settlement billing', IbphRecState=1, IbphCmpCode=1
    )
    db.add(settle)
    db.commit()

    print(f"SUCCESS: Seeded clean dummy stay history for John Doe (Admission Code: {ihr_code}, IPD No: 12345)")

except Exception as e:
    print("Database seeding failed:", e)
    db.rollback()
finally:
    db.close()
