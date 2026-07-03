import sys
import os
import datetime

# Adjust path to find backend
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from backend.database import SessionLocal, engine
from backend.models import (
    PatientCategory, Patient, DoctorCategory, DoctorRole, Doctor,
    Floor, Ward, Bed, ServiceGroup, Service,
)
from backend.models.masters import (
    PayDeptMast, PayDesnMast, PayEmpMast,
    RefCatgMst, RefByMast, RefToMast,
    DiagMast, PatMast, DoctMast,
    FloorMast, WardMast, BedMast,
    ServGrpMst, ServMast,
    PartyGrpMst, PartyMast,
    SubItmGrpMst, SubItmMast,
    StsnMast, AreaMast, PatCatgMst, DoctCatgMst, DoctRoleMst
)

def seed_data():
    db = SessionLocal()
    try:
        # Clear existing data to avoid duplicates/conflicts
        print("Clearing existing data from master tables...")
        
        # Order matters due to foreign keys
        tables_to_clear = [
            PayEmpMast, PayDesnMast, PayDeptMast,
            SubItmMast, SubItmGrpMst,
            PartyMast, PartyGrpMst,
            Bed, BedMast,
            Ward, WardMast,
            Floor, FloorMast,
            Service, ServMast,
            ServiceGroup, ServGrpMst,
            RefToMast, RefByMast, RefCatgMst,
            Doctor, DoctMast,
            DoctorRole, DoctRoleMst,
            DoctorCategory, DoctCatgMst,
            Patient, PatMast,
            PatientCategory, PatCatgMst,
            AreaMast, StsnMast,
            DiagMast
        ]
        
        for model in tables_to_clear:
            db.query(model).delete()
        db.commit()
        print("Existing master tables cleared.")

        # 1. Patient Categories
        print("Seeding Patient Categories...")
        pcg_data = [
            {"name": "General", "disc_per": 0.0, "type": "Cash"},
            {"name": "VIP / Executive", "disc_per": 10.0, "type": "Cash"},
            {"name": "CGHS Beneficiary", "disc_per": 15.0, "type": "Credit"},
            {"name": "Staff & Dependents", "disc_per": 20.0, "type": "Cash"},
            {"name": "Apollo TPA Insurance", "disc_per": 5.0, "type": "Credit"}
        ]
        pcg_objs = []
        pcg_legacy_objs = []
        for i, item in enumerate(pcg_data, start=1):
            pcg = PatientCategory(
                pcg_code=i,
                pcg_name=item["name"],
                pcg_inf_allowed=True,
                pcg_def_allowed=True,
                pcg_disc_allowed=item["disc_per"] > 0,
                pcg_disc_per=item["disc_per"],
                pcg_show_in_list=True,
                pcg_rec_state=1,
                pcg_type=item["type"]
            )
            pcg_legacy = PatCatgMst(
                PcgCode=i,
                PcgName=item["name"],
                PcgInfAllowed=True,
                PcgDefAllowed=True,
                PcgDiscAllowed=item["disc_per"] > 0,
                PcgDiscPer=item["disc_per"],
                PcgShowInList=True,
                PcgRecState=1,
                PcgType=item["type"]
            )
            db.add(pcg)
            db.add(pcg_legacy)
            pcg_objs.append(pcg)
            pcg_legacy_objs.append(pcg_legacy)
        db.commit()

        # 2. Stations & Areas
        print("Seeding Stations and Areas...")
        stations_data = ["New Delhi", "Mumbai", "Kolkata", "Bengaluru", "Chennai"]
        stn_objs = []
        for i, name in enumerate(stations_data, start=1):
            stn = StsnMast(StnCode=i, StnName=name, StnShowInList=True, StnRecState=1)
            db.add(stn)
            stn_objs.append(stn)
        db.commit()

        areas_data = [
            {"name": "Connaught Place", "stn_code": 1},
            {"name": "Dwarka Sector 10", "stn_code": 1},
            {"name": "Andheri West", "stn_code": 2},
            {"name": "Bandra East", "stn_code": 2},
            {"name": "Salt Lake Sector 3", "stn_code": 3},
            {"name": "Indiranagar", "stn_code": 4},
            {"name": "Adyar", "stn_code": 5}
        ]
        area_objs = []
        for i, item in enumerate(areas_data, start=1):
            area = AreaMast(AraCode=i, AraName=item["name"], AraStnCode=item["stn_code"], AraRecState=1)
            db.add(area)
            area_objs.append(area)
        db.commit()

        # 3. Patients (Modern & Legacy in Sync)
        print("Seeding Patients...")
        patients_data = [
            {"name": "Aarav Sharma", "sex": "M", "dob": datetime.date(1990, 5, 12), "addr": "Flat 402, Dwarka Sector 10", "tel": "9876543210", "pcg_code": 1, "stn": 1, "area": 2},
            {"name": "Aditi Patel", "sex": "F", "dob": datetime.date(1985, 9, 24), "addr": "Block B, Andheri West", "tel": "9876543211", "pcg_code": 2, "stn": 2, "area": 3},
            {"name": "Rahul Chatterjee", "sex": "M", "dob": datetime.date(1978, 11, 3), "addr": "Sector 3, Salt Lake", "tel": "9876543212", "pcg_code": 3, "stn": 3, "area": 5},
            {"name": "Priya Nair", "sex": "F", "dob": datetime.date(1995, 2, 18), "addr": "12th Cross, Indiranagar", "tel": "9876543213", "pcg_code": 4, "stn": 4, "area": 6},
            {"name": "Vikram Singh", "sex": "M", "dob": datetime.date(2002, 7, 30), "addr": "Besant Nagar", "tel": "9876543214", "pcg_code": 5, "stn": 5, "area": 7}
        ]
        for i, item in enumerate(patients_data, start=1):
            pat = Patient(
                ptt_code=i,
                ptt_name=item["name"],
                ptt_reg_no=10000 + i,
                ptt_reg_date=datetime.datetime.now(),
                ptt_sex=item["sex"],
                ptt_dob=item["dob"],
                ptt_address=item["addr"],
                ptt_telephone=item["tel"],
                ptt_sms_no=item["tel"],
                ptt_email=f"{item['name'].lower().replace(' ', '')}@example.com",
                ptt_pcg_code=item["pcg_code"],
                ptt_remark="Regular checkup",
                ptt_rec_state=1
            )
            pat_mast = PatMast(
                PttCode=i,
                PttName=item["name"],
                PttRegNo=10000 + i,
                PttRegDate=datetime.date.today(),
                PttSex=item["sex"],
                PttDob=item["dob"],
                PttAddr=item["addr"],
                PttTelNo=item["tel"],
                PttSMSNo=item["tel"],
                PttEmail=f"{item['name'].lower().replace(' ', '')}@example.com",
                PttPcgCode=item["pcg_code"],
                PttRemark="Regular checkup",
                PttRecState=1,
                PttAraCode=item["area"],
                PttStnCode=item["stn"],
                PttShowInList=True
            )
            db.add(pat)
            db.add(pat_mast)
        db.commit()

        # 4. Doctor Categories
        print("Seeding Doctor Categories...")
        dcg_data = ["Junior Consultant", "Senior Consultant", "Visiting Consultant", "HOD", "Resident Medical Officer"]
        dcg_objs = []
        for i, name in enumerate(dcg_data, start=1):
            dcg = DoctorCategory(dcg_code=i, dcg_name=name, dcg_rec_state=1)
            dcg_legacy = DoctCatgMst(DcgCode=i, DcgName=name, DcgRecState=1)
            db.add(dcg)
            db.add(dcg_legacy)
            dcg_objs.append(dcg)
        db.commit()

        # 5. Doctor Roles
        print("Seeding Doctor Roles...")
        drl_data = ["Surgeon", "Physician", "Pediatrician", "Cardiologist", "Anesthetist"]
        drl_objs = []
        for i, name in enumerate(drl_data, start=1):
            drl = DoctorRole(drl_code=i, drl_name=name, drl_rec_state=1)
            drl_legacy = DoctRoleMst(DrlCode=i, DrlName=name, DrlRecState=1)
            db.add(drl)
            db.add(drl_legacy)
            drl_objs.append(drl)
        db.commit()

        # 6. Doctors
        print("Seeding Doctors...")
        doctors_data = [
            {"title": "Dr.", "name": "Rajesh Kumar", "specialty": "Cardiology", "dcg": 4, "drl": 4, "addr": "Green Park, Delhi", "tel": "9123456780", "share": 15.0},
            {"title": "Dr.", "name": "Shalini Gupta", "specialty": "Pediatrics", "dcg": 2, "drl": 3, "addr": "Sea Breeze, Mumbai", "tel": "9123456781", "share": 10.0},
            {"title": "Dr.", "name": "Amit Varma", "specialty": "General Surgery", "dcg": 2, "drl": 1, "addr": "Salt Lake, Kolkata", "tel": "9123456782", "share": 20.0},
            {"title": "Dr.", "name": "Sunita Rao", "specialty": "Gynecology", "dcg": 1, "drl": 2, "addr": "Koramangala, Bangalore", "tel": "9123456783", "share": 12.0}
        ]
        for i, item in enumerate(doctors_data, start=1):
            doc = Doctor(
                dct_code=i,
                dct_title=item["title"],
                dct_name=item["name"],
                dct_specialty=item["specialty"],
                dct_dcg_code=item["dcg"],
                dct_drl_code=item["drl"],
                dct_address=item["addr"],
                dct_telephone=item["tel"],
                dct_email=f"dr.{item['name'].lower().replace(' ', '')}@hospital.com",
                dct_share_percent=item["share"],
                dct_rec_state=1
            )
            doc_legacy = DoctMast(
                DctCode=i,
                DctTitle=item["title"],
                DctName=item["name"],
                DctSpeci=item["specialty"],
                DctDcgCode=item["dcg"],
                DctDrlCode=item["drl"],
                DctAddr=item["addr"],
                DctTelNo=item["tel"],
                DctEmail=f"dr.{item['name'].lower().replace(' ', '')}@hospital.com",
                DctShare=item["share"],
                DctRecState=1
            )
            db.add(doc)
            db.add(doc_legacy)
        db.commit()

        # 7. Referred Categories, Referred By, Referred To
        print("Seeding Referrals...")
        ref_catgs = ["Private Clinic", "Government Hospital", "Diagnostic Center", "General Practitioner", "Online Referral"]
        for i, name in enumerate(ref_catgs, start=1):
            rc = RefCatgMst(RfgCode=i, RfgName=name, RfgRecState=1)
            db.add(rc)
        db.commit()

        ref_by_data = [
            {"name": "Dr. K.P. Shah", "speci": "Family Physician", "rfg": 4, "addr": "Station Road, Delhi", "tel": "9234567890", "share": 10.0},
            {"name": "Dr. Meena Joshi", "speci": "Gynecologist", "rfg": 1, "addr": "Market Lane, Mumbai", "tel": "9234567891", "share": 12.0},
            {"name": "Dr. Anil Mehta", "speci": "Pediatrician", "rfg": 3, "addr": "Lake Road, Kolkata", "tel": "9234567892", "share": 8.0}
        ]
        for i, item in enumerate(ref_by_data, start=1):
            rb = RefByMast(
                RByCode=i,
                RByName=item["name"],
                RBySpeci=item["speci"],
                RByRfgCode=item["rfg"],
                RByAddr=item["addr"],
                RByTelNo=item["tel"],
                RByEmail=f"{item['name'].lower().replace(' ', '').replace('.', '')}@ref.com",
                RByShare=item["share"],
                RByRecState=1
            )
            db.add(rb)
        db.commit()

        ref_to_data = [
            {"name": "Dr. S.K. Sen", "speci": "Neurologist", "rfg": 1, "addr": "Apollo Hospital, Delhi", "tel": "9345678901", "share": 5.0},
            {"name": "Dr. Ritu Bhalla", "speci": "Oncologist", "rfg": 3, "addr": "Tata Memorial Hospital, Mumbai", "tel": "9345678902", "share": 5.0}
        ]
        for i, item in enumerate(ref_to_data, start=1):
            rt = RefToMast(
                RToCode=i,
                RToName=item["name"],
                RToSpeci=item["speci"],
                RToRfgCode=item["rfg"],
                RToAddr=item["addr"],
                RToTelNo=item["tel"],
                RToEmail=f"{item['name'].lower().replace(' ', '').replace('.', '')}@refto.com",
                RToShare=item["share"],
                RToRecState=1
            )
            db.add(rt)
        db.commit()

        # 8. Floors, Wards, Beds
        print("Seeding Floors, Wards, and Beds...")
        floors_data = ["Ground Floor", "First Floor", "Second Floor", "Third Floor", "ICU Floor"]
        for i, name in enumerate(floors_data, start=1):
            fl = Floor(flr_code=i, flr_name=name, flr_rec_state=1, flr_show_in_list=True)
            fl_legacy = FloorMast(FlrCode=i, FlrName=name, FlrShowInList=True, FlrRecState=1)
            db.add(fl)
            db.add(fl_legacy)
        db.commit()

        wards_data = [
            {"name": "General Ward", "floor": 1},
            {"name": "Semi-Private Ward", "floor": 2},
            {"name": "Deluxe Ward", "floor": 3},
            {"name": "ICU Ward", "floor": 5},
            {"name": "Paediatric Ward", "floor": 2}
        ]
        for i, item in enumerate(wards_data, start=1):
            wd = Ward(wrd_code=i, wrd_name=item["name"], wrd_flr_code=item["floor"], wrd_rec_state=1, wrd_show_in_list=True)
            wd_legacy = WardMast(WrdCode=i, WrdName=item["name"], WrdShowInList=True, WrdRecState=1)
            db.add(wd)
            db.add(wd_legacy)
        db.commit()

        beds_data = [
            {"name": "G-01", "ward": 1, "floor": 1, "chg": 1000.0},
            {"name": "G-02", "ward": 1, "floor": 1, "chg": 1000.0},
            {"name": "SP-01", "ward": 2, "floor": 2, "chg": 2500.0},
            {"name": "D-01", "ward": 3, "floor": 3, "chg": 5000.0},
            {"name": "ICU-01", "ward": 4, "floor": 5, "chg": 8000.0}
        ]
        for i, item in enumerate(beds_data, start=1):
            bd = Bed(
                bdm_code=i,
                bdm_name=item["name"],
                bdm_wrd_code=item["ward"],
                bdm_flr_code=item["floor"],
                bdm_charges=item["chg"],
                bdm_disc_allowed=True,
                bdm_disc_per=5.0,
                bdm_chk_out_time_basis="24 Hours",
                bdm_chk_time="12:00 PM",
                bdm_free_allot=False,
                bdm_remark="Standard bed",
                bdm_show_in_list=True,
                bdm_rec_state=1,
                is_occupied=False
            )
            bd_legacy = BedMast(
                BdmCode=i,
                BdmName=item["name"],
                BdmWrdCode=item["ward"],
                BdmFlrCode=item["floor"],
                BdmCharges=item["chg"],
                BdmDiscAllowed=True,
                BdmDiscPer=5.0,
                BdmChkOutTimeBasis="24 Hours",
                BdmChkTime=720,  # 12 * 60
                BdmFreeAllot=False,
                BdmRemark="Standard bed",
                BdmShowInList=True,
                BdmRecState=1
            )
            db.add(bd)
            db.add(bd_legacy)
        db.commit()

        # 9. Service Groups & Services
        print("Seeding Service Groups and Services...")
        sg_data = ["Consultation Fee", "Room & Nursing Charges", "Laboratory Investigations", "Operation Theater Charges", "Diagnostic Imaging"]
        for i, name in enumerate(sg_data, start=1):
            sg = ServiceGroup(sgp_code=i, sgp_name=name, sgp_rec_state=1, sgp_show_in_list=True)
            sg_legacy = ServGrpMst(SgpCode=i, SgpName=name, SgpShowInList=True, SgpRecState=1)
            db.add(sg)
            db.add(sg_legacy)
        db.commit()

        srv_data = [
            {"name": "General OPD Consultation", "sg": 1, "rate": 500.0},
            {"name": "Specialist Consultation", "sg": 1, "rate": 800.0},
            {"name": "Routine Nursing Care (Per Day)", "sg": 2, "rate": 600.0},
            {"name": "Complete Blood Count (CBC)", "sg": 3, "rate": 350.0},
            {"name": "Routine Urine Analysis", "sg": 3, "rate": 150.0},
            {"name": "Laparoscopic Surgery Charge", "sg": 4, "rate": 45000.0},
            {"name": "Chest X-Ray (PA View)", "sg": 5, "rate": 450.0},
            {"name": "Ultrasound Whole Abdomen", "sg": 5, "rate": 1200.0}
        ]
        for i, item in enumerate(srv_data, start=1):
            srv = Service(
                srv_code=i,
                srv_name=item["name"],
                srv_sgp_code=item["sg"],
                srv_rate=item["rate"],
                srv_show_in_list=True,
                srv_rec_state=1
            )
            srv_legacy = ServMast(
                SrvCode=i,
                SrvName=item["name"],
                SrvSgpCode=item["sg"],
                SrvCharges=item["rate"],
                SrvShowInList=True,
                SrvRecState=1
            )
            db.add(srv)
            db.add(srv_legacy)
        db.commit()

        # 10. Party Groups & Parties (Suppliers)
        print("Seeding Vendor/Party Groups and Parties...")
        pg_data = ["Pharmaceutical Vendors", "Surgical Equipments Suppliers", "Lab Reagents Distributors", "General Utilities Vendors"]
        for i, name in enumerate(pg_data, start=1):
            pg = PartyGrpMst(PgmCode=i, PgmName=name, PgmRecState=1)
            db.add(pg)
        db.commit()

        parties_data = [
            {"name": "Cipla Pharmaceuticals Ltd", "group": 1, "addr": "Industrial Area Phase 1, Delhi", "tel": "011-2345678"},
            {"name": "Hindustan Syringes & Medical Devices Co", "group": 2, "addr": "Udyog Vihar Phase 4, Gurgaon", "tel": "0124-567890"},
            {"name": "Roche Diagnostics India", "group": 3, "addr": "Bandra Kurla Complex, Mumbai", "tel": "022-7654321"},
            {"name": "Ecolab Cleaning Solutions", "group": 4, "addr": "Peenya Industrial Area, Bangalore", "tel": "080-8765432"}
        ]
        for i, item in enumerate(parties_data, start=1):
            prt = PartyMast(
                PrtCode=i,
                PrtName=item["name"],
                PrtPgmCode=item["group"],
                PrtAddr=item["addr"],
                PrtTelNo=item["tel"],
                PrtSMSNo="999999990" + str(i),
                PrtAraCode=1,
                PrtRecState=1,
                PrtShowInList=True
            )
            db.add(prt)
        db.commit()

        # 11. Product Groups & Products
        print("Seeding Product Groups and Products...")
        sig_data = ["Antibiotics", "Cardiovascular Drugs", "Surgical Disposable Gloves", "Syringes & Needles"]
        for i, name in enumerate(sig_data, start=1):
            sig = SubItmGrpMst(SigCode=i, SigName=name, SigRecState=1)
            db.add(sig)
        db.commit()

        products_data = [
            {"name": "Amoxicillin 500mg Capsule", "group": 1},
            {"name": "Azithromycin 500mg Tablet", "group": 1},
            {"name": "Atorvastatin 10mg Capsule", "group": 2},
            {"name": "Amlodipine 5mg Tablet", "group": 2},
            {"name": "Sterile Latex Gloves (Size 7.0)", "group": 3},
            {"name": "Disposable Syringe 5ml with Needle", "group": 4},
            {"name": "Insulin Syringe 1ml (U-40)", "group": 4}
        ]
        for i, item in enumerate(products_data, start=1):
            prod = SubItmMast(
                SimCode=i,
                SimName=item["name"],
                SimSigCode=item["group"],
                SimPurchRate=10.0 + i*2,
                SimMRPRate=15.0 + i*3,
                SimSaleRate=14.0 + i*3,
                SimRecState=1
            )
            db.add(prod)
        db.commit()

        # 12. Payroll Departments, Designations, Employees
        print("Seeding Payroll Department, Designation, and Employees...")
        pay_depts = ["Nursing Service Department", "General Administration", "Accounts & Billing", "General Housekeeping", "Hospital Pharmacy"]
        for i, name in enumerate(pay_depts, start=1):
            pd = PayDeptMast(PdpCode=i, PdpName=name, PdpDesc=name + " staff", PdpRecState=1)
            db.add(pd)
        db.commit()

        pay_desns = ["Staff Nurse", "Nursing Superintendent", "Chief Accountant", "Front Office Assistant", "Hospital Pharmacist"]
        for i, name in enumerate(pay_desns, start=1):
            pdn = PayDesnMast(PdnCode=i, PdnName=name, PdnDesc=name + " role", PdnRecState=1)
            db.add(pdn)
        db.commit()

        employees_data = [
            {"title": "Mr.", "name": "Ankit Sharma", "dept": 2, "desn": 4, "gender": "Male", "salary": 25000.0},
            {"title": "Ms.", "name": "Mary Kutty", "dept": 1, "desn": 2, "gender": "Female", "salary": 55000.0},
            {"title": "Mrs.", "name": "Priya Sen", "dept": 3, "desn": 3, "gender": "Female", "salary": 38000.0},
            {"title": "Mr.", "name": "John D'Souza", "dept": 5, "desn": 5, "gender": "Male", "salary": 32000.0},
            {"title": "Ms.", "name": "Anjali G", "dept": 1, "desn": 1, "gender": "Female", "salary": 28000.0}
        ]
        for i, item in enumerate(employees_data, start=1):
            emp = PayEmpMast(
                PemCode=i,
                PemTitle=item["title"],
                PemName=item["name"],
                PemDeptCode=item["dept"],
                PemDesnCode=item["desn"],
                PemGender=item["gender"],
                PemDOB=datetime.date(1990 - i, 1, 1),
                PemDOJ=datetime.date(2020, 1, 1),
                PemPhone="989898980" + str(i),
                PemEmail=item["name"].lower().replace(" ", "").replace("'", "") + "@hospital.com",
                PemAddress=f"Staff Quarter Q-{i}, HMS Campus",
                PemBasicSalary=item["salary"],
                PemRecState=1
            )
            db.add(emp)
        db.commit()

        # 13. Diagnoses
        print("Seeding Diagnoses...")
        diagnoses = [
            "Essential (Primary) Hypertension",
            "Type 2 Diabetes Mellitus",
            "Acute Appendicitis",
            "Acute Gastroenteritis",
            "Viral Fever (Unspecified)",
            "Chronic Obstructive Pulmonary Disease",
            "Urinary Tract Infection (UTI)"
        ]
        for i, name in enumerate(diagnoses, start=1):
            dg = DiagMast(DigCode=i, DigName=name, DigRecState=1)
            db.add(dg)
        db.commit()

        # Reset serial sequences for all auto-increment tables in Postgres to avoid sequence conflicts on next inserts
        print("Resetting PostgreSQL database serial sequences...")
        tables_and_sequences = [
            ("patient_categories", "pcg_code"),
            ("PatCatgMst", "PcgCode"),
            ("patients", "ptt_code"),
            ("PatMast", "PttCode"),
            ("doctor_categories", "dcg_code"),
            ("DoctCatgMst", "DcgCode"),
            ("doctor_roles", "drl_code"),
            ("DoctRoleMst", "DrlCode"),
            ("doctors", "dct_code"),
            ("DoctMast", "DctCode"),
            ("floors", "flr_code"),
            ("FloorMast", "FlrCode"),
            ("wards", "wrd_code"),
            ("WardMast", "WrdCode"),
            ("beds", "bdm_code"),
            ("BedMast", "BdmCode"),
            ("service_groups", "sgp_code"),
            ("ServGrpMst", "SgpCode"),
            ("services", "srv_code"),
            ("ServMast", "SrvCode"),
            ("RefCatgMst", "RfgCode"),
            ("RefByMast", "RByCode"),
            ("RefToMast", "RToCode"),
            ("PartyGrpMst", "PgpCode"),
            ("PartyMast", "PtyCode"),
            ("SubItmGrpMst", "SigCode"),
            ("SubItmMast", "SimCode"),
            ("PayDeptMast", "PdpCode"),
            ("PayDesnMast", "PdnCode"),
            ("PayEmpMast", "PemCode"),
            ("DiagMast", "DigCode"),
            ("StsnMast", "StnCode"),
            ("AreaMast", "AraCode")
        ]

        from sqlalchemy import text
        for table, pk in tables_and_sequences:
            try:
                # Find the sequence name
                seq_query = f"SELECT pg_get_serial_sequence('\"{table}\"', '{pk}');"
                seq_name_res = db.execute(text(seq_query)).fetchone()
                if seq_name_res and seq_name_res[0]:
                    seq_name = seq_name_res[0]
                    reset_query = f"SELECT setval('{seq_name}', COALESCE((SELECT MAX(\"{pk}\") FROM \"{table}\"), 1), true);"
                    db.execute(text(reset_query))
            except Exception as e:
                # Silently catch if table doesn't have sequence or table doesn't exist
                pass
        db.commit()

        print("\n" + "="*50)
        print("SUCCESS: Database master tables successfully seeded!")
        print("="*50)

    except Exception as e:
        db.rollback()
        print("\nERROR occurred while seeding database:", e)
        raise e
    finally:
        db.close()

if __name__ == "__main__":
    seed_data()
