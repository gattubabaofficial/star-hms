# Phase 7: OPD Billing Execution Plan

1. **API Expansion (`packages/api/src/routes/opd.routes.ts`)**
   - Add a transaction-based `POST /billing` endpoint.
   - The endpoint must:
     - Create `OutdHdr`.
     - Create multiple `OutdBill` records.
     - Create `OutdBlDctDtl` records for doctor shares.
     - Create an initial `OutdBlPymtHdr` if payment is made.
   - Add `GET /billing` and `GET /billing/:id` with full relations.
   - Add `DELETE /billing/:id` for logical voiding.

2. **Frontend Component Creation (`apps/web/src/pages/opd/Billing.tsx`)**
   - Implement the `Billing` page using `SummaryDetailLayout`.
   - **Summary View**: `GridModule` listing recent bills.
   - **Detail View**: 
     - Header info (Patient lookup, Doctor lookup, Date).
     - Dynamic Service Grid (Add/Remove rows).
     - Individual service rate/discount calculation.
     - Subtotal/Total calculation.
     - Payment entry section.
   - Use `LookupField` for Patients, Doctors, and Services.

3. **Routing Integration**
   - Add the new Billing page to `App.tsx`.
   - Update `Sidebar.tsx` if necessary (though it might already have the link placeholders).
