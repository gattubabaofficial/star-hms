from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from backend.routers import auth, masters, opd, ipd, pharmacy, reports, system, lab, setup, pricing, sync
from backend.database import engine, Base
import backend.models.auth
import backend.models.masters

# Create tables if they don't exist
Base.metadata.create_all(bind=engine)

app = FastAPI(
    title="HMS Web Application API",
    description="Backend API for HMS Web Migration (VB6 to FastAPI)",
    version="1.0.0",
)

# CORS configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Adjust this in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth.router, prefix="/api/auth", tags=["auth"])
app.include_router(setup.router, prefix="/api/setup", tags=["setup"])
app.include_router(masters.router, prefix="/api/masters", tags=["masters"])
app.include_router(opd.router, prefix="/api/opd", tags=["opd"])
app.include_router(ipd.router, prefix="/api/ipd", tags=["ipd"])
app.include_router(pharmacy.router, prefix="/api/pharmacy", tags=["pharmacy"])
app.include_router(reports.router, prefix="/api/reports", tags=["reports"])
app.include_router(system.router, prefix="/api/system", tags=["system"])
app.include_router(lab.router, prefix="/api/lab", tags=["lab"])
app.include_router(pricing.router, prefix="/api/pricing", tags=["pricing"])
app.include_router(sync.router, prefix="/api/sync", tags=["sync"])

@app.get("/")
def read_root():
    return {"message": "Welcome to HMS API"}

@app.get("/health")
def health_check():
    return {"status": "ok"}
