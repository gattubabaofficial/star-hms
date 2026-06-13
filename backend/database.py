import os
from sqlalchemy import create_engine
from sqlalchemy.orm import declarative_base, sessionmaker

# Ensure that the DATABASE_URL is set in the environment or provide a default for local dev
DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://postgres:admin%40123@localhost:5432/star-hms")

engine = create_engine(DATABASE_URL, echo=False)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()