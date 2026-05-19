# Execution Plan

1. **Install UI Modules**
   - Execute `pnpm add` for `lucide-react` (icons), `ag-grid-react` & `ag-grid-community` (data grids), and `date-fns` (for the standard HMS status clock).

2. **Core Layout Component (`AppShell`)**
   - Create `apps/web/src/components/layout/AppShell.tsx` and `.module.css`.
   - Setup a `CSS Grid` scaffolding containing `Sidebar`, `Main Area`, and `StatusBar`.

3. **Status Bar implementation**
   - Read from `useAuthStore` to actively display Company Code/Name, User Name, Role, Current Date and live clock.

4. **Sidebar Component**
   - Build a collapsible UI list representing the major VB6 Menus (`Hospital Masters`, `OPD`, `IPD`, `Lab`, `Pharmacy`, `Reports`, `System`).

5. **Shared React Templates**
   - `SummaryDetailLayout.tsx` (a 2-tab view bridging 'Summary' and 'Detail')
   - `FormModeSelector.tsx` (View/New/Edit/Delete action buttons)
   - `GridModule.tsx` (A standard wrapper around `AgGridReact`)
   - `LookupField.tsx` (An async react-select replacement tying into database fetches based on keystrokes).
