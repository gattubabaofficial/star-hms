# HMS Web Application — Project State

## Current Phase
Phase 1: Database Schema & Seed (🔄 Needs rework — MongoDB → PostgreSQL)

## Milestone
Milestone 1: Core Application (v1.0)

## Status
- **Phases completed:** 0 out of 22
- **Next action:** `/gsd-plan-phase 1` — Plan the database schema migration

## Context
- Monorepo initialized with pnpm workspaces
- API server exists at packages/api/ with Express + Prisma (currently MongoDB)
- Web app exists at apps/web/ with Vite + React (minimal — App.tsx, main.tsx, index.css)
- Sync agent scaffolded at apps/sync-agent/
- Auth routes implemented (packages/api/src/routes/auth.routes.ts) but on MongoDB
- RBAC middleware exists (packages/api/src/middleware/)
- VB6 source code available in Hospital/ directory (170 files)
- Live data available in HITBLT18 1111/ directory (Access .mdb databases)

## Key Decisions Made
1. Switch from MongoDB to PostgreSQL (PRD requirement)
2. Preserve VB6 field names as quoted PostgreSQL identifiers
3. Use Summary+Detail layout pattern (matches VB6 forms)
4. Local-wins sync strategy

## Blockers
None

---
*Last updated: 2026-04-12*
