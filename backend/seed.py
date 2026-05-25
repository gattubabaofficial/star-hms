import sys
import os

# Add the parent directory to sys.path so we can import from backend
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from backend.database import SessionLocal, engine, Base
from backend.models.auth import Company, UserRoleMst, UserMast, UserRightMst
from passlib.context import CryptContext

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def seed():
    # Base.metadata.create_all(bind=engine) # Handled by Alembic instead

    db = SessionLocal()
    try:
        # Seed Company
        if not db.query(Company).first():
            company = Company(
                CmpName="Star Hospital Default",
                CmpAddress="123 Health Ave",
                CmpCity="Metropolis",
                CmpOPhone="555-0101",
                CmpEmail="admin@starhospital.com"
            )
            db.add(company)
            db.commit()

        # Seed Admin Role
        if not db.query(UserRoleMst).filter_by(UrlName="Administrator").first():
            admin_role = UserRoleMst(UrlName="Administrator")
            db.add(admin_role)
            db.commit()
            db.refresh(admin_role)

            # Seed Admin User
            if not db.query(UserMast).filter_by(UsrName="admin").first():
                admin_user = UserMast(
                    UsrName="admin",
                    UsrUrlCode=admin_role.UrlCode,
                    UsrPwd=pwd_context.hash("admin123")
                )
                db.add(admin_user)
                db.commit()
                db.refresh(admin_user)

                # Seed Admin Rights for all menu options
                menu_options = [
                    "OPD Registration", "OPD Bill", "OPD Receipt", "OPD Payment", "OPD Refund",
                    "IPD Registration", "IPD Bill", "IPD Receipt", "IPD Payment", "IPD Refund", "Bed Status",
                    "LAB Receipt", "LAB Payment", "LAB Refund",
                    "Patient Master", "Doctor Master", "Service Master", "Bed Master",
                    "User Master", "User Rights Master", "Company Information",
                    "Collection Report", "Service/Bill Report",
                    "Medical Store", "Take Backup"
                ]

                for opt in menu_options:
                    right = UserRightMst(
                        UhtUsrCode=admin_user.UsrCode,
                        UhtUrlCode=admin_role.UrlCode,
                        UhtSecuOptName=opt,
                        UhtCanAdd=True,
                        UhtCanEdit=True,
                        UhtCanDelete=True,
                        UhtCanView=True
                    )
                    db.add(right)
                db.commit()

        print("Database seeded successfully!")
    except Exception as e:
        print(f"Error seeding database: {e}")
        db.rollback()
    finally:
        db.close()

if __name__ == "__main__":
    seed()
