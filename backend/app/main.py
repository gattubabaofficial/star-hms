from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from .routers import auth, masters, opd, services, lab, pharmacy, reporting, finance
from .routers.opd import router as opd_router
from .routers.ipd import router as ipd_router, billing_router as ipd_billing_router

app = FastAPI(title="STAR HMS API", version="1.0.0")

# Set up CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Register routers
app.include_router(auth.router, prefix="/api")
app.include_router(masters.router, prefix="/api")
app.include_router(opd_router, prefix="/api")
app.include_router(ipd_router, prefix="/api")
app.include_router(ipd_billing_router, prefix="/api")
app.include_router(services.router, prefix="/api")
app.include_router(lab.router, prefix="/api")
app.include_router(pharmacy.router, prefix="/api")
app.include_router(reporting.router, prefix="/api")
app.include_router(finance.router, prefix="/api")

@app.get("/health")
def health_check():
    return {"status": "healthy", "service": "FastAPI stand-alone server"}
