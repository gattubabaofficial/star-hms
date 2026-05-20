# Phase 4: Core Hospital Masters (Patient & Doctor)

## Goal
Implement reliable CRUD (Create, Read, Update, Delete) capability APIs backing the primary Hospital Master tables seamlessly porting MS Access schemas entirely onto Postgres. Provide web abstractions utilizing the generic Web architecture built during Phase 3.

## Business Context
Data integrity relies strictly on keeping `RecState` tracking alive rather than issuing hard deletes to map historically valid referrals. Valid dependencies exist linking generic `DoctMast` profiles straight to specific categorical constraints located within `DoctCatgMst` and `DoctRoleMst`.

## Target Modifiers
- `PatCatgMst` (Patient Categories handling discounts / def restrictions)
- `DoctCatgMst` (Doctor Category configuration)
- `DoctMast`     (Master Consultant directory)
- `RefByMast` / `RefToMast` (Referral mappings)
