import pyodbc
from sqlalchemy import text
from backend.database import SessionLocal, engine
from backend.models import (
    PatientCategory, Patient, DoctorCategory, DoctorRole, Doctor,
    Floor, Ward, Bed, ServiceGroup, Service
)

MDB_PATH = r"c:\Users\Dell\OneDrive\Desktop\star-hms\_legacy\original_files\HITBLT18 1111\HospMast.Mdb"

def get_access_connection():
    conn_str = (
        r"DRIVER={Microsoft Access Driver (*.mdb, *.accdb)};"
        f"DBQ={MDB_PATH};"
    )
    return pyodbc.connect(conn_str)

def reset_sequence(db, table_name, pk_col):
    sql = f"SELECT setval(pg_get_serial_sequence('{table_name}', '{pk_col}'), COALESCE(max({pk_col}), 1)) FROM {table_name};"
    try:
        db.execute(text(sql))
        db.commit()
    except Exception as e:
        print(f"Could not reset sequence for {table_name}: {e}")

def migrate():
    print("Connecting to Access legacy database...")
    try:
        acc_conn = get_access_connection()
    except Exception as e:
        print(f"Error connecting to Access: {e}")
        return
        
    acc_cursor = acc_conn.cursor()
    db = SessionLocal()
    
    # 1. Patient Categories
    print("Migrating PatientCategory...")
    acc_cursor.execute("SELECT * FROM PatCatgMst")
    rows = acc_cursor.fetchall()
    cols = [c[0] for c in acc_cursor.description]
    for row in rows:
        data = dict(zip(cols, row))
        cat = db.query(PatientCategory).filter(PatientCategory.pcg_code == data['PcgCode']).first()
        if not cat:
            new_cat = PatientCategory(
                pcg_code=data['PcgCode'],
                pcg_name=data['PcgName'],
                pcg_inf_allowed=bool(data['PcgInfAllowed']),
                pcg_def_allowed=bool(data['PcgDefAllowed']),
                pcg_disc_allowed=bool(data['PcgDiscAllowed']),
                pcg_disc_per=float(data['PcgDiscPer'] or 0.0),
                pcg_show_in_list=bool(data['PcgShowInList']),
                pcg_rec_state=data['PcgRecState']
            )
            db.add(new_cat)
    db.commit()
    reset_sequence(db, 'patient_categories', 'pcg_code')

    # 2. Doctor Categories
    print("Migrating DoctorCategory...")
    acc_cursor.execute("SELECT * FROM DoctCatgMst")
    rows = acc_cursor.fetchall()
    cols = [c[0] for c in acc_cursor.description]
    for row in rows:
        data = dict(zip(cols, row))
        cat = db.query(DoctorCategory).filter(DoctorCategory.dcg_code == data['DcgCode']).first()
        if not cat:
            new_cat = DoctorCategory(
                dcg_code=data['DcgCode'],
                dcg_name=data['DcgName'],
                dcg_rec_state=data['DcgRecState']
            )
            db.add(new_cat)
    db.commit()
    reset_sequence(db, 'doctor_categories', 'dcg_code')

    # 3. Doctor Roles
    print("Migrating DoctorRole...")
    acc_cursor.execute("SELECT * FROM DoctRoleMst")
    rows = acc_cursor.fetchall()
    cols = [c[0] for c in acc_cursor.description]
    for row in rows:
        data = dict(zip(cols, row))
        role = db.query(DoctorRole).filter(DoctorRole.drl_code == data['DrlCode']).first()
        if not role:
            new_role = DoctorRole(
                drl_code=data['DrlCode'],
                drl_name=data['DrlName'],
                drl_rec_state=data['DrlRecState']
            )
            db.add(new_role)
    db.commit()
    reset_sequence(db, 'doctor_roles', 'drl_code')

    # 4. Doctors
    print("Migrating Doctor...")
    acc_cursor.execute("SELECT * FROM DoctMast")
    rows = acc_cursor.fetchall()
    cols = [c[0] for c in acc_cursor.description]
    for row in rows:
        data = dict(zip(cols, row))
        dct = db.query(Doctor).filter(Doctor.dct_code == data['DctCode']).first()
        if not dct:
            new_dct = Doctor(
                dct_code=data['DctCode'],
                dct_title=data['DctTitle'],
                dct_name=data['DctName'],
                dct_specialty=data['DctSpeci'],
                dct_dcg_code=data['DctDcgCode'],
                dct_drl_code=data['DctDrlCode'],
                dct_address=data['DctAddr'],
                dct_telephone=data['DctTelNo'],
                dct_email=data['DctEmail'],
                dct_share_percent=float(data['DctShare'] or 0.0),
                dct_rec_state=data['DctRecState']
            )
            db.add(new_dct)
    db.commit()
    reset_sequence(db, 'doctors', 'dct_code')

    # 5. Patients
    print("Migrating Patient (this might take a few seconds)...")
    acc_cursor.execute("SELECT * FROM PatMast")
    rows = acc_cursor.fetchall()
    cols = [c[0] for c in acc_cursor.description]
    for row in rows:
        data = dict(zip(cols, row))
        ptt = db.query(Patient).filter(Patient.ptt_code == data['PttCode']).first()
        if not ptt:
            new_ptt = Patient(
                ptt_code=data['PttCode'],
                ptt_name=data['PttName'],
                ptt_reg_no=data['PttRegNo'],
                ptt_reg_date=data['PttRegDate'],
                ptt_sex=data['PttSex'],
                ptt_dob=data['PttDob'],
                ptt_address=data['PttAddr'],
                ptt_telephone=data['PttTelNo'],
                ptt_sms_no=data['PttSMSNo'],
                ptt_email=data['PttEmail'],
                ptt_pcg_code=data['PttPcgCode'],
                ptt_remark=data['PttRemark'],
                ptt_rec_state=data['PttRecState']
            )
            db.add(new_ptt)
    db.commit()
    reset_sequence(db, 'patients', 'ptt_code')

    # 6. Floors
    print("Migrating Floor...")
    acc_cursor.execute("SELECT * FROM FloorMast")
    rows = acc_cursor.fetchall()
    cols = [c[0] for c in acc_cursor.description]
    for row in rows:
        data = dict(zip(cols, row))
        flr = db.query(Floor).filter(Floor.flr_code == data['FlrCode']).first()
        if not flr:
            new_flr = Floor(
                flr_code=data['FlrCode'],
                flr_name=data['FlrName'],
                flr_rec_state=data['FlrRecState']
            )
            db.add(new_flr)
    db.commit()
    reset_sequence(db, 'floors', 'flr_code')

    # 7. Wards
    print("Migrating Ward...")
    acc_cursor.execute("SELECT * FROM WardMast")
    rows = acc_cursor.fetchall()
    cols = [c[0] for c in acc_cursor.description]
    for row in rows:
        data = dict(zip(cols, row))
        wrd = db.query(Ward).filter(Ward.wrd_code == data['WrdCode']).first()
        if not wrd:
            new_wrd = Ward(
                wrd_code=data['WrdCode'],
                wrd_name=data['WrdName'],
                wrd_flr_code=None,
                wrd_rec_state=data['WrdRecState']
            )
            db.add(new_wrd)
    db.commit()
    reset_sequence(db, 'wards', 'wrd_code')

    # 8. Beds
    print("Migrating Bed...")
    acc_cursor.execute("SELECT * FROM BedMast")
    rows = acc_cursor.fetchall()
    cols = [c[0] for c in acc_cursor.description]
    for row in rows:
        data = dict(zip(cols, row))
        bed = db.query(Bed).filter(Bed.bdm_code == data['BdmCode']).first()
        if not bed:
            new_bed = Bed(
                bdm_code=data['BdmCode'],
                bdm_name=data['BdmName'],
                bdm_wrd_code=data['BdmWrdCode'],
                bdm_rec_state=data['BdmRecState'],
                is_occupied=False
            )
            db.add(new_bed)
            
            # Reconstruct Ward-Floor relation from Bed info
            wrd = db.query(Ward).filter(Ward.wrd_code == data['BdmWrdCode']).first()
            if wrd and wrd.wrd_flr_code is None and data['BdmFlrCode']:
                wrd.wrd_flr_code = data['BdmFlrCode']
    db.commit()
    reset_sequence(db, 'beds', 'bdm_code')

    # 9. Service Groups
    print("Migrating ServiceGroup...")
    acc_cursor.execute("SELECT * FROM ServGrpMst")
    rows = acc_cursor.fetchall()
    cols = [c[0] for c in acc_cursor.description]
    for row in rows:
        data = dict(zip(cols, row))
        grp = db.query(ServiceGroup).filter(ServiceGroup.sgp_code == data['SgpCode']).first()
        if not grp:
            new_grp = ServiceGroup(
                sgp_code=data['SgpCode'],
                sgp_name=data['SgpName'],
                sgp_rec_state=data['SgpRecState']
            )
            db.add(new_grp)
    db.commit()
    reset_sequence(db, 'service_groups', 'sgp_code')

    # 10. Services
    print("Migrating Service...")
    acc_cursor.execute("SELECT * FROM ServMast")
    rows = acc_cursor.fetchall()
    cols = [c[0] for c in acc_cursor.description]
    for row in rows:
        data = dict(zip(cols, row))
        srv = db.query(Service).filter(Service.srv_code == data['SrvCode']).first()
        if not srv:
            new_srv = Service(
                srv_code=data['SrvCode'],
                srv_name=data['SrvName'],
                srv_sgp_code=data['SrvSgpCode'],
                srv_rate=float(data['SrvRate'] or 0.0),
                srv_rec_state=data['SrvRecState']
            )
            db.add(new_srv)
    db.commit()
    reset_sequence(db, 'services', 'srv_code')

    acc_conn.close()
    db.close()
    print("Migration completed successfully!")

if __name__ == "__main__":
    migrate()
