# Overall Architecture (arc42)

## 1. Introduction and Goals

This template defines a single-repo project structure for agent-first development, explicit governance, and deterministic verification.

## 2. Constraints

1. one repository
2. language-agnostic source layout
3. explicit split between docs and governance
4. deterministic local verify path from day one
5. library-first and app-first repositories must both fit without structural drift

## 3. Building Block View

1. `src/lib/` = reusable project logic
2. `src/tst/` = deterministic tests
3. `src/app/` = optional entrypoints and adapters for repositories that need executable surfaces
4. `doc/*` = explanation, onboarding, and architecture docs
5. `adm/*` = planning, governance, operations, and reports
6. `utl/*` = local checks and small helper scripts
