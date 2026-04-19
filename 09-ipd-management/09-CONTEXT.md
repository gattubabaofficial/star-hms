# Phase 9: IPD Admission & Ward Management

## Goal
Implement the Inpatient Department (IPD) admission process and the spatial management of the hospital (Floors, Wards, and Beds). This allows the hospital to track admitted patients, manage bed occupancy, and link inpatient stay details.

## Business Context
Inpatient management is the most resource-intensive part of hospital operations. It requires:
- Managing physical spaces: `FloorMast`, `WardMast`, and `BedMast`.
- Tracking the admission lifecycle: `IndrHdr` (Admission), `IBedState` (Bed State/Occupancy), and `IndrReg` (IPD Registration).
- Real-time occupancy tracking to prevent double-booking.

## Target Modifiers
- `FloorMast` (Physical Floors)
- `WardMast` (Hospital Wards)
- `BedMast` (Ward Beds)
- `IndrHdr` (Inpatient Header / Admission)
- `IBedState` (Bed Occupancy tracking)
- `IndrReg` (IPD initial registration record)
