---
wave: 1
depends_on: []
files_modified:
  - packages/api/prisma/schema.prisma
  - packages/api/prisma/seed.ts
  - packages/api/src/routes/auth.routes.ts
  - packages/api/src/middleware/rbac.middleware.ts
  - packages/api/.env
autonomous: true
---

# Phase 1: Database Schema & Seed Plan

## Goal
Transform the existing MongoDB/Prisma schema into a PostgreSQL-compatible schema that strictly mirrors the MS Access database structure, ensuring that integer-based legacy IDs serve as primary and foreign keys. This phase also includes migrating the database, generating seed data, and fixing any API routes that break due to the schema change.

## Requirements Addressed
- **R1.1**: PostgreSQL schema with 50+ tables matching VB6 field naming conventions.
- **R1.2**: Prisma schema.prisma mirroring tables with proper relations and field types.
- **R1.3**: Migration files for schema creation.
- **R1.4**: Seed script for default Company, admin User, UserRole, and UserRights.
- **R1.5**: SyncLog and SyncConfig tables for sync tracking.

## Tasks

### [BLOCKING] Task 1: Update Prisma Provider and Connections
<read_first>
- packages/api/prisma/schema.prisma
- packages/api/.env
</read_first>
<action>
Modify `packages/api/prisma/schema.prisma`:
1. Change the `provider` in the `datasource db` block from `"mongodb"` to `"postgresql"`.
2. Ensure the generator block `provider` is `"prisma-client-js"`.

Modify `packages/api/.env`:
1. Update `DATABASE_URL` to point to a local PostgreSQL instance (e.g., `postgresql://postgres:postgres@localhost:5432/hms?schema=public`).
</action>
<acceptance_criteria>
- `packages/api/prisma/schema.prisma` contains `provider = "postgresql"`
- `packages/api/.env` contains a valid `postgresql://` string in `DATABASE_URL`
</acceptance_criteria>

### [BLOCKING] Task 2: Rewrite Schema Models for PostgreSQL
<read_first>
- packages/api/prisma/schema.prisma
- .planning/phases/01-database-schema-seed/01-RESEARCH.md
</read_first>
<action>
Rewrite EVERY model in `packages/api/prisma/schema.prisma` to remove MongoDB artifacts and establish correct integer relations:
1. Delete all `id String @id @default(auto()) @map("_id") @db.ObjectId` lines.
2. For every master table (e.g., `Company`, `UserRoleMst`, `UserMast`), promote its `xxxCode` field (e.g., `CmpCode`, `UrlCode`, `UsrCode`) to be the primary key: change `@unique` to `@id @default(autoincrement())`.
3. For foreign keys (e.g., `UsrUrlCode`), ensure they are strictly of type `Int?` (not `String?`).
4. Update the `@relation` directives to reference the new integer primary keys. For example: `Role UserRoleMst? @relation(fields: [UsrUrlCode], references: [UrlCode])`.
5. Add the `SyncLog` and `SyncConfig` models:
   ```prisma
   model SyncLog {
     id        Int      @id @default(autoincrement())
     tableName String
     timestamp DateTime @default(now())
     status    String
     records   Int
     error     String?
   }
   model SyncConfig {
     id           Int      @id @default(autoincrement())
     lastSyncTime DateTime
     status       String
   }
   ```
</action>
<acceptance_criteria>
- `packages/api/prisma/schema.prisma` contains exactly 0 occurrences of `@db.ObjectId`
- `packages/api/prisma/schema.prisma` contains exactly 0 occurrences of `@map("_id")`
- `npx prisma format` runs successfully without syntax errors
</acceptance_criteria>

### [BLOCKING] Task 3: Database Push and Client Generation
<read_first>
- packages/api/prisma/schema.prisma
</read_first>
<action>
Run the Prisma CLI to sync the schema to the database and generate the TS client:
1. Execute `cd packages/api && npx prisma generate`
2. Execute `cd packages/api && npx prisma db push --accept-data-loss` (this requires a running Postgres DB)
</action>
<acceptance_criteria>
- `npx prisma db push` exits with code 0
- The PostgreSQL database has all 50+ tables created
</acceptance_criteria>

### Task 4: Fix Broken API Routes
<read_first>
- packages/api/src/routes/auth.routes.ts
- packages/api/src/middleware/rbac.middleware.ts
</read_first>
<action>
The change from `id: string` to numeric codes will break the auth and RBAC logic.
1. Update `auth.routes.ts` `login` handler. Instead of searching by `id`, search by `UsrCode` and include relations using the Int keys.
2. Ensure the JWT token payload stores the integer `usrCode`, `urlCode`, and `cmpCode`.
3. Update `rbac.middleware.ts` to check permissions matching integer `UhtUrlCode`.
4. Run `tsc --noEmit` in `packages/api` to verify types.
</action>
<acceptance_criteria>
- `cd packages/api && npx tsc --noEmit` exits with code 0
</acceptance_criteria>

### Task 5: Create and Run Seed Script
<read_first>
- packages/api/prisma/schema.prisma
</read_first>
<action>
Create `packages/api/prisma/seed.ts`. Use Prisma `upsert` to generate fundamental records needed to bootstrap the app:
1. `Company` (CmpCode: 1, CmpName: "Default Hospital").
2. `UserRoleMst` (UrlCode: 1, UrlName: "Administrator").
3. `UserMast` (UsrCode: 1, UsrName: "admin", UsrPwd: "[hashed-password]", UsrUrlCode: 1).
4. `UserRightMst` (UhtCode: 1..., creating full rights for standard menu options).
Update `packages/api/package.json` to include `"prisma": { "seed": "ts-node prisma/seed.ts" }`.
Run `npx prisma db seed`.
</action>
<acceptance_criteria>
- `packages/api/prisma/seed.ts` exists and contains Prisma Client `upsert` calls for Admin data
- `packages/api/package.json` contains a `prisma.seed` config block
</acceptance_criteria>

## Verification
- Run `ls packages/api/prisma/schema.prisma`
- Verify DB tables exist by querying Postgres or checking Prisma Studio.
- Build the API package (`npm run build`).

## Must Haves
- The schema MUST generate without errors.
- Foreign keys MUST be integers mirroring their VB6 counterparts.
- Zero references to MongoDB artifacts.
