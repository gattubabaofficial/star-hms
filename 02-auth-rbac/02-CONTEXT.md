# Phase 2: Authentication & Authorization

## Goal
Establish JWT-based authentication with company-aware logins, robust RBAC (Role-Based Access Control) middleware, and consistent session state management using Zustand on the React application. 

## Business Rules
- Login mandates a `username`, `password`, and `companyCode`.
- The generated JWT token must encapsulate `usrCode`, `usrName`, `urlCode` (Role ID), `urlName` (if loaded), and `cmpCode`.
- A frontend `Zustand` store stores the Company context, FY (Financial Year context), User Profile, and UI options based on roles.
- `GET /api/auth/me` fetches the profile using the valid Bearer JWT.

## Integration Dependencies
- Relies on the `Company`, `UserMast`, `UserRoleMst`, and `UserRightMst` schemas established in Phase 1 setup.
