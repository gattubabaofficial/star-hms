# Execution Plan

1. **API Expansion (`packages/api/src/routes/services.routes.ts`)**
   - Bind robust `GET`, `POST`, `PUT`, `DELETE` routes for `/api/services/groups` mapped strictly against `ServGrpMst`.
   - Implement routes for `/api/services/master` bridging into `ServMast`.
   - Filter deletions strictly across `SgpRecState: 0` and `SrvRecState: 0` handling soft-deletes universally preventing orphaned bills!

2. **Frontend Page Setup (`apps/web/src/pages/services/`)**
   - `ServiceGroup.tsx`: Build a powerful React UI replicating VB6 toggles into a sleek modern two-column checkbox flow. This involves handling over 20+ specific boolean tags controlling exact price variation systems identically.
   - `ServiceMaster.tsx`: Standard UI merging generic text input charges (`SrvCharges`) alongside `<LookupField>` configurations assigning Services directly into specified Groups (`SgpCode`).

3. **Web Layout Routing**
   - Map `/services/groups` and `/services/master` accurately into the safe React `<AppShell>` frame!
