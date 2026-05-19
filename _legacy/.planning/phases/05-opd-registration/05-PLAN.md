# Execution Plan

1. **API Expansion (`packages/api/src/routes/opd.routes.ts`)**
   - Bind robust `GET`, `POST`, `PUT`, `DELETE` routes for `/api/opd/registration` pointing directly into `OutdReg` tracking records.
   - Implement strict relational linking including `ConsultingDoctor` and `Patient`.
   - Setup `/api/opd/patient` routes mirroring `PatMast` logic.
   - Inject Geo lookup endpoints evaluating `AreaMast` and `StsnMast`.

2. **Server Middleware Integrations**
   - Attach `/api/opd` directly onto `server.ts` respecting standard token parameters internally.

3. **Frontend Page Setup (`apps/web/src/pages/opd/`)**
   - `Registration.tsx`: This is the primary heavy-duty Form replacing `FrmOpgEntry.frm`. Layout must support large amounts of lookup fields spanning Patient Name bindings bridging directly via `<LookupField>` templates mapping PatMast -> PatCatgMst mapping parameters seamlessly evaluating discount availability dynamically!
   - `PatientMaster.tsx`: A standard `GridModule` wrapper listing historical visitors seamlessly.

4. **Web Layout Routing**
   - Import `Registration.tsx` onto the React `<AppShell>` mapping URLs accurately!
