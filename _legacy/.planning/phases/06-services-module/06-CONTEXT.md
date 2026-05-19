# Phase 6: Services Module (Groups & ServMast)

## Goal
Implement reliable CRUD capabilities for compiling Hospital Services into specific Billing structures. This replaces the complex legacy `FrmServGrpMst.frm` and `FrmServMast.frm` screens which define all logic for generating billing charges dynamically inside OPD and Bed modules!

## Business Context
Data integrity of the entire hospital's accounting software rests securely on these tables.
`ServGrpMst` specifies massive boolean matrices (ex. `SgpExtRateSys`, `SgpDiscAllowed`) dictating exactly whether child services can fluctuate in pricing depending on Doctors, Patients, or outside referrers!
`ServMast` stores explicit individual operations (i.e. 'Consultation Checkup', 'Blood Sugar Test') bridging directly into these groups mirroring the matrices while defaulting isolated `SrvCharges`.

## Target Modifiers
- `ServGrpMst` (Service Groups handling huge toggle parameters)
- `ServMast` (Core Services mapping over Groups identically bridging baseline rates/discounts)
