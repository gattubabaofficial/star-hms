# Phase 1: Database Schema & Seed - Context

**Gathered:** 2026-04-12
**Status:** Ready for planning
**Source:** PRD Express Path / Derived from REQUIREMENTS.md

<domain>
## Phase Boundary

This phase establishes the foundational PostgreSQL database schema for the entire HMS Web Application. It involves translating the legacy VB6 MS Access database structures (50+ tables) into a modern relational schema managed by Prisma ORM, handling the migration from the previously attempted MongoDB setup. It also includes creating the initial seed data (Company, Admin user, Master defaults) to bootstrap the application.

</domain>

<decisions>
## Implementation Decisions

### Technical Stack & ORM
- Use PostgreSQL instead of MongoDB.
- Use Prisma as the ORM to define the schema and manage migrations.
- The existing Prisma schema configured for MongoDB must be rewritten for PostgreSQL.

### Database Design & Schema Matching
- **VB6 Field Name Preservation**: Must strictly mirror the VB6 field naming convention (e.g., `PcgCode`, `DctName`, `OpgTotal`).
- Use quoted column names or Prisma `@map` directives to map camelCase Model fields to PascalCase database columns if necessary, but preserving exact string casing matching the `.mdb` field names is critical to ensure seamless sync.
- **Relational Integrity**: Enforce foreign key constraints at the database level leveraging PostgreSQL capabilities, which were implicit/soft in MS Access.

### Sync Agent Preparation
- **Soft Delete**: Tables must track deletion using `RecState` (1=Active, 0=Deleted) as the soft-delete mechanism, matching the legacy approach.
- Include `SyncLog` and `SyncConfig` tables to track local-to-cloud sync events.

### Seed Data Requirement
- Generate a seed script (`seed.ts`).
- Ensure it creates a default `Company`, `Admin` User, `UserRole`, and grants full `UserRights` to all menu options.

### the agent's Discretion
- Best practices for organizing a large `schema.prisma` file (e.g., grouping models by module).
- Exact Prisma `@relation` names.
- Setup of `.env` files for the Postgres connection strings for local development.

</decisions>

<canonical_refs>
## Canonical References

**Downstream agents MUST read these before planning or implementing.**

### Project Specifications
- `PRD.md` — The original requirements document containing database schema details.
- `.planning/PROJECT.md` — Key decisions and overall migration context.
- `.planning/REQUIREMENTS.md` — Comprehensive breakdown of requirement IDs R1.1 to R1.5.

</canonical_refs>

<specifics>
## Specific Ideas
- "Quoted identifiers": In Prisma, the easiest way to preserve exact VB6 case (e.g., `PcgCode` instead of `pcgCode`) without Prisma complaining about PascalCase fields is to either use mapping (`@map("PcgCode")`) or conform to Prisma naming but strictly map the DB names.
- Given the instruction "Use quoted column names in PostgreSQL", Prisma's exact behavior with casing needs to be researched to guarantee the DB table/column names match precisely.
</specifics>

<deferred>
## Deferred Ideas
None — All phase schema requirements are explicitly in scope.
</deferred>

---

*Phase: 01-database-schema-seed*
*Context gathered: 2026-04-12*
