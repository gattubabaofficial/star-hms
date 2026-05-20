# Phase 3: Application Shell & Shared Components

## Goal
Establish the canonical Single Page Application framing for the HMS Web Dashboard. The web UI needs to structurally mirror the classic VB6 experience providing a familiar sidebar, a resilient layout, and a consistent layout for all Data Entry Forms.

## Requirements from PRD
- Construct the primary `AppShell` dictating the layout (Sidebar on left, Top Navbar / Content in Center, Status Bar docked cleanly at the bottom).
- The `StatusBar` must relay active state reading from `Zustand` (Company, User, Role, Date/Time).
- Design a generic `SummaryDetailLayout` allowing users to toggle between a Data Grid view (List) and a Form view (Editor).
- Build reusable UI primitives like `FormMode` selector (New/View/Edit/Delete), a robust `DataGrid` (via `ag-grid`), and async `LookupField` tools mapping to PostgreSQL lookups.
