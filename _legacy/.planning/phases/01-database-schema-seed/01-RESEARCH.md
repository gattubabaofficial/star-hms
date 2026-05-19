# Phase 1: Database Schema & Seed - Technical Research

## Objective
Research how to implement Phase 1: Database Schema & Seed, focusing on migrating the existing Prisma MongoDB schema to PostgreSQL while preserving MS Access compatibility.

## Current State Analysis
The existing `packages/api/prisma/schema.prisma` is configured for MongoDB:
- Generates `ObjectId` strings for primary keys (`id String @id @default(auto()) @map("_id") @db.ObjectId`).
- Uses these artificial string keys for foreign key relationships (e.g., `UsrUrlCode String? @db.ObjectId`).

## Architectural Flaw Discovered
MS Access databases do *not* use UUIDs or string ObjectIDs. The VB6 application uses the internal Integer sequence fields (e.g., `UrlCode`, `CmpCode`, `DctCode`) as the primary and foreign keys.
If we keep artificial string IDs for foreign keys, the `sync-agent` will not be able to push raw MS Access integer foreign keys directly into the cloud database without massive mapping overhead.

## Required Approach for PostgreSQL

### 1. Connection & Provider
Change provider to PostgreSQL:
```prisma
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}
```

### 2. Primary Keys & Foreign Keys
We must drop the artificial string `id` fields. The integer `xxxCode` fields (which are currently marked `@unique`) should become the actual `@id` fields if they are the true primary keys in Access.
Alternatively, if we keep `id Int @id @default(autoincrement())`, we must change the foreign key columns (like `UsrUrlCode`) to be `Int`, and they must reference the unique code fields (e.g., `UrlCode`), not an artificial ID.
**Recommendation**: Make the Access primary key (the `xxxCode` field) the Prisma `@id` directly.
Example:
```prisma
model UserRoleMst {
  UrlCode       Int            @id @default(autoincrement())
  UrlName       String
  UrlRecState   Int            @default(1)
  UserMast      UserMast[]
  UserRightMst  UserRightMst[]
}

model UserMast {
  UsrCode       Int            @id @default(autoincrement())
  UsrName       String
  UsrUrlCode    Int?
  // ...
  Role          UserRoleMst?    @relation(fields: [UsrUrlCode], references: [UrlCode])
}
```

### 3. Case Sensitivity & Naming
PostgreSQL lowercases unquoted identifiers. Prisma handles this, but to ensure database columns exactly match VB6 (for the sync agent and raw queries), Prisma handles casing naturally. However, if the field is defined as `PcgCode Int`, Prisma makes the DB column `PcgCode` (quoted).
This is exactly what we want. We do not need `@map()` unless we want camelCase in TS, but the PRD says "Preserve VB6 field names", so we can just use PascalCase in the Prisma model fields.

### 4. Sync Tracking Tables
We need to add:
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

### 5. Seed Script
We need to write `packages/api/prisma/seed.ts` containing Prisma client calls to `upsert` default records.

## Conclusion
The schema translation requires meticulously rewriting relationships in `schema.prisma` to link via the Integer fields, removing MongoDB directives, and updating the API routes if they specifically relied on string `id` fields.
