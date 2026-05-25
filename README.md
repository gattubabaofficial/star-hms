# STAR HMS (Hospital Management System)

STAR HMS is a comprehensive, modern, and highly responsive Hospital Management System built to handle Outpatient (OPD) and Inpatient (IPD) workflows, hospital masters configuration, pharmacy stock management, and laboratory operations. It features a React-based frontend styled with Tailwind CSS and a Python FastAPI backend powered by PostgreSQL.

---

## 🏥 Modules & Features (Tabs)

### 1. Dashboard
- **Overview**: Provides a bird's-eye view of hospital operations. Displays quick statistics like total active OPD patients, currently admitted IPD patients, and recent financial transactions.

### 2. OPD (Outpatient Department)
- **Overview**: Dashboard specifically for outpatient metrics and recent registrations.
- **Registration**: Register new patients for doctor consultations. Features quick inline-creation of new patients, doctors, and diagnoses if they don't exist in the masters.
- **Billing**: Generate bills for OPD services and consultations.
- **Payment / Refund**: Record advance payments, clear outstanding bills, or initiate refunds for OPD patients.
- **Receipt Viewer**: View and print generated receipts and invoices.

### 3. IPD (Inpatient Department)
- **Overview**: Dashboard for inpatient metrics, including admitted vs. discharged patient counts, and a bulk **"Add Room Layout"** feature to quickly generate floors, wards, and beds.
- **Bed Status**: A live, visually rich layout of hospital beds organized into collapsible/compressible tabs by Floor and Ward. Displays real-time occupancy with color-coding (Red = Occupied, Green = Vacant) and hover tooltips showing patient details.
- **Admission**: Admit patients into specific floors, wards, and beds. 
- **Billing / Payment / Refund**: End-to-end financial management for admitted patients.
- **Receipt Viewer**: View and print IPD receipts.

### 4. Hospital Masters
A centralized configuration module to manage core hospital data entities:
- **Patients**: Manage demographic and contact details of all registered patients.
- **Doctors & Referred By**: Manage consulting doctors and referring entities.
- **Diagnostics & Services**: Configure hospital services, service groups, and diagnostic categories.
- **Infrastructure (Floors, Wards, Beds)**: Define the physical layout of the hospital.

### 5. Pharmacy
- **Purchase Entry**: Record new medicine stock purchases from vendors.
- **Sales Dispense**: Dispense medicines to patients and generate bills.
- **Stock Register**: View real-time inventory levels of all pharmacy items.

### 6. Laboratory
- Manage laboratory tests, diagnostic reports, and lab billing workflows.

### 7. System
- **Sync Configuration**: Manage data synchronization settings.
- **User Management**: Admin controls for users and role-based permissions.

---

## 📊 Database ER Diagram

The database is built on PostgreSQL using SQLAlchemy ORM. Below is a simplified Entity-Relationship (ER) diagram representing the core tables and their relationships across the system.

```mermaid
erDiagram
    %% Core Masters
    PatMast {
        int PttCode PK
        string PttName
        string PttMobile
        string PttSex
        string PttType
    }
    DoctMast {
        int DctCode PK
        string DctName
    }
    BedMast {
        int BdmCode PK
        string BdmName
        int BdmFlrCode FK
        int BdmWrdCode FK
        boolean is_occupied
    }
    FloorMast {
        int FlrCode PK
        string FlrName
    }
    WardMast {
        int WrdCode PK
        string WrdName
    }

    %% OPD Module
    OutdHdr {
        int OpgCode PK
        int OpgPttCode FK
        int OpgCDctCode FK
        float OpgRate
    }
    OutdBill {
        int OblCode PK
        int OblOpgCode FK
        float OblNetAmt
    }
    OutdPymtHdr {
        int OpmCode PK
        int OpmOpgCode FK
        float OpmAmt
    }

    %% IPD Module
    IndrHdr {
        int IhdCode PK
        int IhdPttCode FK
        int IhdCDctCode FK
        int IhdBedCode FK
        string IhdStatus
    }
    IndrBill {
        int IblCode PK
        int IblIhdCode FK
        float IblNetAmt
    }

    %% Relationships
    FloorMast ||--o{ BedMast : "Contains"
    WardMast ||--o{ BedMast : "Contains"
    
    PatMast ||--o{ OutdHdr : "Registers for OPD"
    DoctMast ||--o{ OutdHdr : "Consults (OPD)"
    OutdHdr ||--o| OutdBill : "Generates"
    OutdHdr ||--o{ OutdPymtHdr : "Has Payments"
    
    PatMast ||--o{ IndrHdr : "Admitted in IPD"
    DoctMast ||--o{ IndrHdr : "Consults (IPD)"
    BedMast ||--o| IndrHdr : "Occupies"
    IndrHdr ||--o| IndrBill : "Generates"
```

> **Note**: This is a simplified, high-level view highlighting the most critical relationships. The actual database contains over 40+ tables including granular details for Pharmacy (`SubItmMast`, `StkTrans`), Lab (`LabHdr`, `LabRcpt`), and robust authentication (`UserMast`, `UserRoleMst`).

---

## 🚀 Setup & Installation Guide

Follow these steps to run STAR HMS locally on your machine.

### 1. Database Setup (PostgreSQL)
1. Install [PostgreSQL](https://www.postgresql.org/download/).
2. Open `psql` or pgAdmin and create a new database:
   ```sql
   CREATE DATABASE hospital_db;
   ```
3. (Optional) Create a specific user/password for the application.
4. Open the file `backend/database.py` and ensure the `DATABASE_URL` matches your local Postgres credentials:
   ```python
   # Example: postgresql://username:password@localhost/dbname
   DATABASE_URL = "postgresql://postgres:postgres@localhost/hospital_db"
   ```

### 2. Backend Setup (FastAPI)
The backend is powered by Python and FastAPI.

1. Navigate to the root directory of the project in your terminal.
2. (Optional but recommended) Create a virtual environment:
   ```bash
   python -m venv venv
   venv\Scripts\activate  # For Windows
   ```
3. Install the required Python packages:
   ```bash
   pip install "fastapi[all]" sqlalchemy psycopg2-binary passlib "bcrypt==4.0.1" pyjwt python-multipart
   ```
   *(Note: Ensure `bcrypt==4.0.1` is used to prevent compatibility issues with `passlib`)*
4. Start the backend server:
   ```bash
   python -m uvicorn backend.main:app --reload
   ```
   The backend will automatically create all database tables on startup. The API docs will be available at `http://127.0.0.1:8000/docs`.

### 3. Frontend Setup (React + Vite)
The frontend is powered by React, Vite, and Tailwind CSS.

1. Open a new terminal and navigate to the `frontend` directory:
   ```bash
   cd frontend
   ```
2. Install the required Node modules:
   ```bash
   npm install
   ```
3. Start the Vite development server:
   ```bash
   npm run dev
   ```
4. Open your browser and navigate to the local URL provided by Vite (usually `http://localhost:5173`).

---

**You are now ready to use STAR HMS!**
