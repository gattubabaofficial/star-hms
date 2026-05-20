# Execution Plan

1. **API Construction (`packages/api/src/routes/masters.routes.ts`)**
   - Bind dedicated endpoints `GET`, `POST`, `PUT`, `DELETE` manipulating schemas:
     - `/api/masters/patient-category` (`PatCatgMst`)
     - `/api/masters/doctor-category` (`DoctCatgMst`)
     - `/api/masters/doctor-master` (`DoctMast`)
     - `/api/masters/referral-master` (`RefByMast`)
   - Handle logical DB Deletes evaluating `RecState: 0`.

2. **Frontend Page Generation (`apps/web/src/pages/masters/`)**
   - `PatientCategory.tsx`: Mount `SummaryDetailLayout`. In summary mode: `GridModule` mapping `PcgCode` & `PcgName` bindings. Detail mode displays native text/check inputs handling logic.
   - `DoctorCategory.tsx`: Standard dictionary mappings.
   - `DoctorMaster.tsx`: Complex relational mapping integrating `LookupField` components reading endpoints resolving roles natively into `DctDrlCode`.
   - `ReferralMaster.tsx`: Standard relational mappings.

3. **Routing Integration (`App.tsx`)**
   - Extend the `<AppShell>` child router logic registering all four master URLs explicitly resolving 404 dependencies mapped earlier.
