import sys
import os

# Adjust path to find backend
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from backend.database import SessionLocal
from backend.models.pathology import (
    TestMethodMast, TestSampTypMast, TestGrpMast, TestDeptMast, TestParaMast, TestFmtMast, TestValCalcMast
)

def seed_pathology():
    db = SessionLocal()
    try:
        # Clear existing pathology tables
        print("Clearing existing pathology masters...")
        db.query(TestValCalcMast).delete()
        db.query(TestParaMast).delete()
        db.query(TestFmtMast).delete()
        db.query(TestDeptMast).delete()
        db.query(TestGrpMast).delete()
        db.query(TestSampTypMast).delete()
        db.query(TestMethodMast).delete()
        db.commit()

        print("Seeding Lab Test Methods...")
        methods = [
            TestMethodMast(TmhCode=1, TmhName="ELISA", TmhShowInList=True, TmhRecState=1, TmhIndex=1),
            TestMethodMast(TmhCode=2, TmhName="Microscopy", TmhShowInList=True, TmhRecState=1, TmhIndex=2),
            TestMethodMast(TmhCode=3, TmhName="Culture & Sensitivity", TmhShowInList=True, TmhRecState=1, TmhIndex=3),
            TestMethodMast(TmhCode=4, TmhName="Automated Analyzer", TmhShowInList=True, TmhRecState=1, TmhIndex=4),
            TestMethodMast(TmhCode=5, TmhName="Rapid Card Test", TmhShowInList=True, TmhRecState=1, TmhIndex=5)
        ]
        db.add_all(methods)

        print("Seeding Lab Test Sample Types...")
        samples = [
            TestSampTypMast(TspCode=1, TspName="Whole Blood", TspIndex=1, TspShowInList=True, TspRecState=1),
            TestSampTypMast(TspCode=2, TspName="Serum", TspIndex=2, TspShowInList=True, TspRecState=1),
            TestSampTypMast(TspCode=3, TspName="Urine", TspIndex=3, TspShowInList=True, TspRecState=1),
            TestSampTypMast(TspCode=4, TspName="Sputum", TspIndex=4, TspShowInList=True, TspRecState=1),
            TestSampTypMast(TspCode=5, TspName="CSF (Cerebrospinal Fluid)", TspIndex=5, TspShowInList=True, TspRecState=1)
        ]
        db.add_all(samples)

        print("Seeding Lab Test Groups...")
        groups = [
            TestGrpMast(TgpCode=1, TgpName="Complete Blood Count (CBC)", TgpPrintName="CBC Profile", TgpShowInList=True, TgpRecState=1, TgpIndex=1),
            TestGrpMast(TgpCode=2, TgpName="Lipid Profile", TgpPrintName="Lipid Profile", TgpShowInList=True, TgpRecState=1, TgpIndex=2),
            TestGrpMast(TgpCode=3, TgpName="Liver Function Test (LFT)", TgpPrintName="LFT Profile", TgpShowInList=True, TgpRecState=1, TgpIndex=3),
            TestGrpMast(TgpCode=4, TgpName="Kidney Function Test (KFT)", TgpPrintName="KFT Profile", TgpShowInList=True, TgpRecState=1, TgpIndex=4),
            TestGrpMast(TgpCode=5, TgpName="Thyroid Profile (T3, T4, TSH)", TgpPrintName="Thyroid Panel", TgpShowInList=True, TgpRecState=1, TgpIndex=5)
        ]
        db.add_all(groups)

        print("Seeding Lab Test Departments...")
        departments = [
            TestDeptMast(TdpCode=1, TdpName="Hematology", TdpPrintName="Dept of Hematology", TdpIndex=1, TdpShowInList=True, TdpRecState=1),
            TestDeptMast(TdpCode=2, TdpName="Biochemistry", TdpPrintName="Dept of Clinical Biochemistry", TdpIndex=2, TdpShowInList=True, TdpRecState=1),
            TestDeptMast(TdpCode=3, TdpName="Microbiology", TdpPrintName="Dept of Microbiology", TdpIndex=3, TdpShowInList=True, TdpRecState=1),
            TestDeptMast(TdpCode=4, TdpName="Serology", TdpPrintName="Dept of Serology & Immunology", TdpIndex=4, TdpShowInList=True, TdpRecState=1),
            TestDeptMast(TdpCode=5, TdpName="Hormones / Special Chemistry", TdpPrintName="Special Hormones Lab", TdpIndex=5, TdpShowInList=True, TdpRecState=1)
        ]
        db.add_all(departments)

        print("Seeding Lab Test Parameters...")
        parameters = [
            TestParaMast(TprCode=1, TprName="Haemoglobin", TprPrintName="Haemoglobin (Hb)", TprTmhCode=4, TprTgpCode=1, TprTdpCode=1, TprTspCode=1, TprRng1=12.0, TprRng2=16.0, TprRngUnit="g/dL", TprIndex=1, TprShowInList=True, TprRecState=1),
            TestParaMast(TprCode=2, TprName="Total WBC Count", TprPrintName="Total Leucocyte Count (TLC)", TprTmhCode=2, TprTgpCode=1, TprTdpCode=1, TprTspCode=1, TprRng1=4000.0, TprRng2=11000.0, TprRngUnit="/cumm", TprIndex=2, TprShowInList=True, TprRecState=1),
            TestParaMast(TprCode=3, TprName="Total Cholesterol", TprPrintName="Serum Total Cholesterol", TprTmhCode=4, TprTgpCode=2, TprTdpCode=2, TprTspCode=2, TprRng1=100.0, TprRng2=200.0, TprRngUnit="mg/dL", TprIndex=3, TprShowInList=True, TprRecState=1),
            TestParaMast(TprCode=4, TprName="Serum Bilirubin", TprPrintName="Bilirubin Total", TprTmhCode=4, TprTgpCode=3, TprTdpCode=2, TprTspCode=2, TprRng1=0.2, TprRng2=1.2, TprRngUnit="mg/dL", TprIndex=4, TprShowInList=True, TprRecState=1),
            TestParaMast(TprCode=5, TprName="Serum Creatinine", TprPrintName="Serum Creatinine", TprTmhCode=4, TprTgpCode=4, TprTdpCode=2, TprTspCode=2, TprRng1=0.5, TprRng2=1.4, TprRngUnit="mg/dL", TprIndex=5, TprShowInList=True, TprRecState=1)
        ]
        db.add_all(parameters)

        print("Seeding Lab Test Formats...")
        formats = [
            TestFmtMast(TfmCode=1, TfmName="Pathology General Format", TfmPrintName="Pathology Report Format", TfmRepStyle="Pathology", TfmIndex=1, TfmShowInList=True, TfmRecState=1, TfmTspCode=1, TfmVtmCode=1),
            TestFmtMast(TfmCode=2, TfmName="Chest X-Ray Format", TfmPrintName="X-Ray Chest PA View Format", TfmRepStyle="X-Ray", TfmIndex=2, TfmShowInList=True, TfmRecState=1, TfmTspCode=2, TfmVtmCode=2),
            TestFmtMast(TfmCode=3, TfmName="Whole Abdomen Sonography Format", TfmPrintName="USG Whole Abdomen Format", TfmRepStyle="Sonography", TfmIndex=3, TfmShowInList=True, TfmRecState=1, TfmTspCode=3, TfmVtmCode=3)
        ]
        db.add_all(formats)

        print("Seeding Test Auto Calculation Methods...")
        calcs = [
            TestValCalcMast(TvcCode=1, TvcName="Indirect Bilirubin Auto Calc", TvcTprCode=4, TvcRemark="Total Bilirubin - Direct Bilirubin", TvcShowInList=True, TvcRecState=1)
        ]
        db.add_all(calcs)

        db.commit()
        print("Pathology master tables seeded successfully!")
    except Exception as e:
        db.rollback()
        print(f"Error seeding pathology: {e}")
    finally:
        db.close()

if __name__ == "__main__":
    seed_pathology()
