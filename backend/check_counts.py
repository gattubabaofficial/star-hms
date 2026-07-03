import sys
import os

# Adjust path to find backend
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from backend.database import SessionLocal
from backend.models import (
    PatientCategory, Patient, DoctorCategory, DoctorRole, Doctor,
    Floor, Ward, Bed, ServiceGroup, Service,
)
from backend.models.masters import (
    PayDeptMast, PayDesnMast, PayEmpMast,
    RefCatgMst, RefByMast, RefToMast,
    DiagMast, PatMast,
    PartyGrpMst, PartyMast,
    SubItmGrpMst, SubItmMast,
    StsnMast, AreaMast,
)

def check_counts():
    db = SessionLocal()
    models = {
        "PatientCategory": PatientCategory,
        "Patient": Patient,
        "PatMast": PatMast,
        "DoctorCategory": DoctorCategory,
        "DoctorRole": DoctorRole,
        "Doctor": Doctor,
        "Floor": Floor,
        "Ward": Ward,
        "Bed": Bed,
        "ServiceGroup": ServiceGroup,
        "Service": Service,
        "PayDeptMast": PayDeptMast,
        "PayDesnMast": PayDesnMast,
        "PayEmpMast": PayEmpMast,
        "RefCatgMst": RefCatgMst,
        "RefByMast": RefByMast,
        "RefToMast": RefToMast,
        "DiagMast": DiagMast,
        "PartyGrpMst": PartyGrpMst,
        "PartyMast": PartyMast,
        "SubItmGrpMst": SubItmGrpMst,
        "SubItmMast": SubItmMast,
        "StsnMast": StsnMast,
        "AreaMast": AreaMast,
    }
    
    print("Database connection check & row counts:")
    print("-" * 40)
    for name, model in models.items():
        try:
            count = db.query(model).count()
            print(f"{name:20} : {count} rows")
        except Exception as e:
            print(f"{name:20} : ERROR - {e}")
            db.rollback()
    db.close()

if __name__ == "__main__":
    check_counts()
