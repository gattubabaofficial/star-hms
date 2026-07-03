import sys
import os
from sqlalchemy import text

# Adjust path to find backend
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from backend.database import engine, Base
import backend.models  # Register all models

def recreate_all_masters():
    tables_to_drop = [
        # Modern Flat Tables
        "patient_categories",
        "patients",
        "doctor_categories",
        "doctor_roles",
        "doctors",
        "floors",
        "wards",
        "beds",
        "service_groups",
        "services",
        
        # Legacy Submodule Tables
        "PatCatgMst",
        "PatMast",
        "DoctCatgMst",
        "DoctRoleMst",
        "DoctMast",
        "FloorMast",
        "WardMast",
        "BedMast",
        "ServGrpMst",
        "ServMast",
        "StsnMast",
        "AreaMast",
        "RefCatgMst",
        "RefByMast",
        "RefToMast",
        "PartyGrpMst",
        "PartyMast",
        "SubItmGrpMst",
        "SubItmMast",
        "PayDeptMast",
        "PayDesnMast",
        "PayEmpMast",
        "DiagMast",
        "DiagSrvMst",
        "BedSrvMst"
    ]
    
    print("Dropping all master tables with CASCADE...")
    with engine.connect() as connection:
        transaction = connection.begin()
        try:
            for table in tables_to_drop:
                sql = f'DROP TABLE IF EXISTS "{table}" CASCADE;'
                connection.execute(text(sql))
                print(f"Dropped {table}")
            transaction.commit()
            print("Drop transaction committed.")
        except Exception as e:
            transaction.rollback()
            print("Error dropping tables, rolled back:", e)
            return

    print("Recreating all master tables using SQLAlchemy metadata...")
    try:
        Base.metadata.create_all(bind=engine)
        print("Master tables successfully recreated.")
    except Exception as e:
        print("Error recreating tables:", e)

if __name__ == "__main__":
    recreate_all_masters()
