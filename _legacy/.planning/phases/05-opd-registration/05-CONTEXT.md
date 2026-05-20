# Phase 5: OPD Registration & Appointments

## Goal
Implement the core daily driver for front-desk operators: OPD Registrations. Outpatient procedures generate instantaneous billing and tracking records bridging patients straight into Consulting references mapped against generic hospital services.

## Business Context
OPD (`OutdReg` & `PatMast`) dictates extreme validation limits. PatCatgMst settings (Inflation, Deflation, Discount rules) immediately validate standard inputs when selecting a patient category. Doctors define standard Consultation limits mapping straight to their Category settings. Everything must map safely against logical references without breaking historical integrity `RecState: 0`.

## Target Modifiers
- `PatMast` (Core Patient Database reference)
- `OutdReg` (Outpatient Registration linking Patients -> Doctors -> Services)
- Geographical Dictionaries: `AreaMast` and `StsnMast` (Stations)
