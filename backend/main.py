from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from backend.routers import auth, masters, opd, ipd, system, lab, pharmacy, reports, accounts
from backend.database import engine, Base
import backend.models       # Register all submodule SQLAlchemy schemas
import backend.models_flat   # Register legacy flat SQLAlchemy schemas

# Create tables in PostgreSQL if they do not exist
Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="HMS Web Application API",
    description="Backend API for HMS Modernization (VB6 to FastAPI)",
    version="1.0.0",
)

# CORS configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Adjust in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth.router, prefix="/api/auth", tags=["auth"])
app.include_router(masters.router, prefix="/api/masters", tags=["masters"])
app.include_router(opd.router, prefix="/api/opd", tags=["opd"])
app.include_router(ipd.router, prefix="/api/ipd", tags=["ipd"])
app.include_router(lab.router, prefix="/api/lab", tags=["lab"])
app.include_router(pharmacy.router, prefix="/api/pharmacy", tags=["pharmacy"])
app.include_router(reports.router, prefix="/api/reports", tags=["reports"])
app.include_router(system.router, prefix="/api/system", tags=["system"])
app.include_router(accounts.router, prefix="/api/accounts", tags=["accounts"])

@app.get("/")
def read_root():
    return {"message": "Welcome to HMS API. Database is connected and online."}

@app.get("/health")
def health_check():
    return {"status": "ok"}
