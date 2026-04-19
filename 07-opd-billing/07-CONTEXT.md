# Phase 7: OPD Billing Configuration

## Goal
Implement the core Outpatient (OPD) Billing system, allowing front-desk operators to generate invoices for multiple services, handle doctor shares, and record payments.

## Business Context
OPD Billing is the primary revenue engine for outpatient operations. It must handle:
- Multiple services in a single invoice.
- Dynamic rate and discount calculations based on Patient Category and Service Group rules.
- Automatic or manual doctor share allocation.
- Payment recording (Cash/Bank/Credit).
- Logical voiding (RecState: 0).

## Target Modifiers
- `OutdHdr` (Billing Header)
- `OutdBill` (Billing Details)
- `OutdBlDctDtl` (Doctor Shares)
- `OutdBlPymtHdr` (Payment Records)
