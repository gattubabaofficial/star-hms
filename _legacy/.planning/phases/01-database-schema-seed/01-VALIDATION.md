# Phase 1: Database Schema & Seed - Validation Strategy

## Dimensions of Validation

1. **Syntax & Compile**: `npx prisma validate` and `npx prisma generate` must succeed without warnings.
2. **Schema Correctness**: `npx prisma migrate dev` must successfully create all tables in a clean PostgreSQL database.
3. **Data Constraint correctness**: Check that `UsrUrlCode` and other foreign keys are translated to `Int` and map to `UrlCode` primary keys, preventing the string GUID issue.
4. **Seed execution**: `npx prisma db seed` must run and populate the `Company`, `UserRoleMst`, `UserMast`, and `UserRightMst` records successfully.
5. **Runtime Integrity**: Ensure the API still builds after the Prisma client is regenerated (the API might have type errors if it expected string `id` fields).

## Nyquist Criteria

These must be verifiable:
- **Test 1**: Verify `schema.prisma` defines `provider = "postgresql"`.
- **Test 2**: Verify there are NO `ObjectId` or `@map("_id")` directives in the schema.
- **Test 3**: Execute Prisma migration and seeding successfully.
- **Test 4**: Run TS build on `packages/api` to verify no lingering references to `id: string` break the build.
