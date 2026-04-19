# Phase 8: Laboratory & Investigations Execution Plan

1. **Backend Integration (`packages/api/src/routes/lab.routes.ts`)**
   - Implement `lab.routes.ts` mirroring the transactional billing style from Phase 7 but targeting `LabHdr`, `LabRcpt`, etc.
   - Set up standard `GET` (history), `POST` (save bill), and `DELETE` (void) routes.
   - Mount in `index.ts`.

2. **Frontend UI Creation (`apps/web/src/pages/lab/LabBilling.tsx`)**
   - Build a dedicated Lab Billing interface.
   - Ensure the `LookupField` for services can be used to filter for lab-specific groups.
   - Implement the same dynamic row logic as general billing.

3. **Routing & Navigation**
   - Register in `App.tsx`.
   - Update navigation components.
