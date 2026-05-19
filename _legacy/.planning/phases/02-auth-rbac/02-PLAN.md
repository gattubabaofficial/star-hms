# Phase 2: Execution Plan

1. **Update API Auth Controller**
   - File: `packages/api/src/routes/auth.routes.ts`
   - Modify the `/login` route to expect `{ username, password, companyCode }` in the request body.
   - Inject the resolved `companyCode` into the backend session JWT.

2. **Establish Frontend Store (Zustand)**
   - File: `apps/web/src/store/authStore.ts`
   - Create a store holding `token`, `user`, `role`, `company`, and `fy` items.
   - Persist token via `localStorage`.

3. **Frontend API Interceptor Scaffold**
   - File: `apps/web/src/api/client.ts`
   - Construct a base axios/fetch query wrapper that reads `useAuthStore.getState().token` and maps it directly automatically to `Authorization: Bearer <TOKEN>`.

4. **Prototypical Login Page**
   - File: `apps/web/src/pages/Login.tsx`
   - Form taking Username, Password, and Company Code mapped to `/api/auth/login`.

5. **RBAC Final Readouts**
   - File: `packages/api/src/middleware/auth.middleware.ts`
   - Enforce rigorous backend logic testing mapping the `OptionName` against `UhtSecuOptName`.
