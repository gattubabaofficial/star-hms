# Phase 10: IPD Billing & Daily Charges

## Goal
Implement the Inpatient Department (IPD) billing engine. This module handles:
- Accruing daily bed/nursing charges based on admission duration.
- Managing inpatient service invoicing (`IndrBlHdr` / `IndrBill`).
- Handling deposits/advances paid by patients during their stay.
- Final discharge settlement and bill generation.

## Business Context
IPD billing is dynamic and cumulative. Unlike OPD's "pay-and-visit" model, IPD bills grow over time:
- **Daily Charges**: Bed rent is calculated from `IBedState` duration.
- **Interim Billing**: Patients may be billed periodically during a long stay.
- **Settlement**: Final payments are adjusted against previous deposits (`IndrBlDpogDtl`).

## Target Modifiers
- `IndrBlHdr` (IPD Bill Header)
- `IndrBill` (IPD Bill Details)
- `IndrBlDctDtl` (Doctor Shares for IPD)
- `IndrBlDpogDtl` (IPD Deposits/Advances)
- `IBedState` (Duration source for bed charges)
