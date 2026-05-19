# Phase 8: Laboratory & Investigations

## Goal
Implement the Laboratory Billing and Investigations management module. This module allows the hospital to record requests for lab tests, process billing for these investigations, and link them to patient records.

## Business Context
Laboratory services are often billed separately from general OPD consultations. This module handles:
- Lab-specific invoices (`LabHdr` / `LabRcpt`).
- Tracking payments for investigative services.
- Mapping individual tests (from `ServMast`) to lab bills.

## Target Modifiers
- `LabHdr` (Lab Bill Header)
- `LabRcpt` (Lab Bill Details/Receipts)
- `LabPymtHdr` (Lab Payment Records)
- `LabRcDctDtl` (Doctor Shares for Lab)
