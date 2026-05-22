# Star HMS (Hospital Management System)

A comprehensive, fully modernized Hospital Management System (HMS) built to replace legacy Microsoft Access systems while maintaining a highly performant, traditional desktop-like interface. 

This project bridges legacy workflows into a modern web ecosystem using **React (Next.js)** on the frontend and **Python (FastAPI) + PostgreSQL** on the backend.

---

## 🏗️ Architecture & Technology Stack

- **Frontend**: Next.js 16 (React) with standard `ag-grid-community` for complex data grids.
- **Styling**: Pure CSS (`forms.css`, `layout.css`, `globals.css`). The UI purposefully avoids utility classes like TailwindCSS to enforce a traditional, dense, and plain software aesthetic typical of enterprise hospital systems.
- **Backend**: FastAPI (Python 3.13) paired with SQLAlchemy 2.0 ORM.
- **Database**: PostgreSQL for robust relational data integrity and transaction handling.
- **Legacy Integration**: Node.js ADODB sync agent (`_legacy/apps/sync-agent`) configured to bridge data from older Microsoft Access (`.mdb`) files to the new cloud infrastructure.

## 📦 System Modules

The application is structured into interconnected operational modules:

### 1. Hospital Masters
Core infrastructure setup for the entire hospital ecosystem.
- **Directories**: Doctors, Patient Categories, Wards, Floors, Beds, and Diagnostic Services.
- **Features**: Complete CRUD operations, real-time mapping, and logical deletion states.

### 2. Outpatient Department (OPD)
Handling day-to-day ambulatory patient visits.
- **Registration**: Auto-generation of patient codes and consultation vouchers.
- **Billing**: Multi-service grid billing with dynamic discount percentages and doctor share calculators.

### 3. Indoor Patient Department (IPD)
Managing complex inpatient hospital stays.
- **Admissions**: Reserving beds and establishing care links with specific consultants.
- **Bed Census**: Live visual dashboard of occupied vs available beds across all wards.
- **IPD Billing**: Automatic daily boarding charge accruals and complex discharge billing.

### 4. Pharmacy & Diagnostic Lab
Inventory and ancillary revenue centers.
- **Pharmacy**: Supplier/Party masters, Drug/Item masters. Dynamic grids for Purchase Entry and Retail Sales.
- **Lab**: Diagnostic test mapping and lab service billing.

### 5. Administration & Reporting
Top-level auditing and oversight.
- **Collection Hub**: Unified dashboard querying and combining revenue streams from OPD, IPD, and the Lab based on configurable date ranges.

## 🚀 Getting Started

### 1. Backend Setup
Navigate to the `backend` directory, install requirements, and start the FastAPI server:

```bash
cd backend
pip install -r requirements.txt
python -m uvicorn app.main:app --reload
```
The backend API will be available at `http://localhost:8000`.

### 2. Frontend Setup
From the project root, install Node dependencies and run the Next.js development server:

```bash
npm install
npm run dev
```
The frontend application will be available at `http://localhost:3000`.

### 3. Sync Agent (Optional)
If running the legacy synchronization bridge:
```bash
cd _legacy/apps/sync-agent
npm install
npm run dev
```

## 🎨 UI/UX Philosophy

This project strictly adheres to a "desktop-software" paradigm on the web:
- **No Tailwind/Utility Clutter**: Components rely on standard `.form-control`, `.form-group`, and `.btn` semantic class names.
- **Density Over Whitespace**: Designed for rapid data entry by hospital administrators who prefer high information density over spaced-out consumer designs.
- **Summary/Detail Layouts**: Uniform master-detail views allowing users to seamlessly transition between looking at a grid of data and entering complex forms.

---
*Built to bring legacy hospital infrastructure into the modern web era.*

## 🗄️ Database Entity-Relationship Diagram

Below is the current relational data structure represented in an ER Diagram (Table Form) showing all key entities, attributes, and relationships.

```mermaid
erDiagram
    %% --- Administration & Auth ---
    Company {
        int CmpCode PK
        string CmpName
    }
    UserRoleMst ||--o{ UserMast : "has"
    UserMast ||--o{ UserRightMst : "has_rights"
    UserRoleMst {
        int UrlCode PK
        string UrlName
    }
    UserMast {
        int UsrCode PK
        string UsrName
        int UsrUrlCode FK
        string UsrPwd
    }

    %% --- Core Masters ---
    PatCatgMst ||--o{ PatMast : "categorizes"
    AreaMast ||--o{ PatMast : "locates"
    StsnMast ||--o{ PatMast : "stations"
    
    PatMast {
        int PttCode PK
        string PttName
        int PttRegNo
        int PttPcgCode FK
        int PttAraCode FK
    }

    DoctCatgMst ||--o{ DoctMast : "categorizes"
    DoctRoleMst ||--o{ DoctMast : "roles"
    DoctMast {
        int DctCode PK
        string DctName
        int DctDcgCode FK
        int DctDrlCode FK
    }

    RefCatgMst ||--o{ RefByMast : "categorizes"
    RefByMast {
        int RByCode PK
        string RByName
        int RByRfgCode FK
    }

    %% --- IPD Masters ---
    WardMast ||--o{ BedMast : "contains"
    FloorMast ||--o{ BedMast : "contains"
    ServMast ||--o{ BedMast : "links_charges"
    BedMast {
        int BdmCode PK
        string BdmName
        int BdmWrdCode FK
        int BdmFlrCode FK
        int BdmSrvCode FK
    }

    %% --- Services ---
    ServGrpMst ||--o{ ServMast : "groups"
    ServMast ||--o{ ServRateMst : "has_rates"
    ServMast {
        int SrvCode PK
        string SrvName
        int SrvSgpCode FK
        float SrvCharges
    }

    %% --- Transactions: OPD ---
    PatMast ||--o{ OutdHdr : "billed_in"
    DoctMast ||--o{ OutdHdr : "consults_in"
    OutdHdr ||--o{ OutdBill : "has_items"
    OutdHdr {
        int OhdCode PK
        int OhdPttCode FK
        int OhdCDctCode FK
        float OhdTotalAmt
    }
    OutdBill {
        int ObdCode PK
        int ObdOhdCode FK
        int ObdSrvCode FK
        float ObdRate
    }

    %% --- Transactions: IPD ---
    PatMast ||--o{ IndrHdr : "admitted_in"
    WardMast ||--o{ IndrHdr : "stays_in"
    BedMast ||--o{ IndrHdr : "occupies"
    IndrHdr ||--o{ IndrBlHdr : "generates_bill"
    IndrBlHdr ||--o{ IndrBill : "has_items"
    
    IndrHdr {
        int IhdCode PK
        int IhdPttCode FK
        int IhdWrdCode FK
        int IhdBedCode FK
        string IhdStatus
    }
    IndrBlHdr {
        int IbhCode PK
        int IbhIhdCode FK
        float IbhTotalAmt
    }

    %% --- Transactions: Pharmacy (Purchases & Sales) ---
    SubItmGrpMst ||--o{ SubItmMast : "groups"
    PartyGrpMst ||--o{ PartyMast : "groups"
    
    SubItmMast {
        int SimCode PK
        string SimName
        int SimSigCode FK
    }
    PartyMast {
        int PryCode PK
        string PryName
        int PryPgpCode FK
    }

    PartyMast ||--o{ MedPurchHdr : "supplies"
    MedPurchHdr ||--o{ MedPurchDtl : "has_items"
    MedPurchHdr {
        int PuhCode PK
        int PuhPrtCode FK
        float PuhTotalAmt
    }

    PatMast ||--o{ MedSaleHdr : "buys"
    MedSaleHdr ||--o{ MedSaleDtl : "has_items"
    MedSaleHdr {
        int SahCode PK
        int SahPttCode FK
        float SahTotalAmt
    }
```

## ⚙️ Environment Configuration (`.env`)

Create a `.env` file inside the `backend` directory. Below is the required format and the fields you need to fill:

```env
# PostgreSQL connection string
DATABASE_URL=postgresql://<USERNAME>:<PASSWORD>@localhost:5432/<DATABASE_NAME>

# JWT Authentication
JWT_SECRET=your_super_secret_key_here
JWT_EXPIRES_IN=24h

# Legacy Sync Configuration
SYNC_API_KEY=hms-sync-secret-key
```

- **`DATABASE_URL`**: The connection string to your PostgreSQL instance. Replace `<USERNAME>`, `<PASSWORD>`, and `<DATABASE_NAME>` with your database credentials.
- **`JWT_SECRET`**: A strong, random string used to sign JWT tokens.
- **`JWT_EXPIRES_IN`**: Token validity duration.
- **`SYNC_API_KEY`**: Secret key used by the legacy Node.js sync agent to securely transfer data.

## 🛢️ PostgreSQL Database Setup

To run this system, you need to create a PostgreSQL database. Follow these steps:

1. **Install PostgreSQL**: Download and install PostgreSQL from the [official website](https://www.postgresql.org/download/).
2. **Open psql or pgAdmin**: Connect to your default Postgres server.
3. **Create the Database**: Run the following SQL command to create the database:
   ```sql
   CREATE DATABASE "star-hms";
   ```
4. **Update `.env`**: Make sure your `.env` file reflects the newly created database name and the password you set during installation:
   `DATABASE_URL=postgresql://postgres:your_password@localhost:5432/star-hms`
5. **Initialize Tables**: When you run the FastAPI backend (`python -m uvicorn app.main:app`), SQLAlchemy will automatically detect the connection and generate the required tables.
