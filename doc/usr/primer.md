# Primer

## What This Project Template Is

This repository is a minimal template for projects that want governed agent-first development and agent-guided documentation without starting from a multi-repo suite.

## Core Structure

- `src/lib/` for reusable project logic
- `src/tst/` for deterministic tests
- `src/app/` for entrypoints and adapters when the repository needs them
- `doc/*` for explanation and onboarding
- `adm/*` for governance, planning, and operations

Library-first repositories are first-class template users.
That means a project may center its implementation entirely in `src/lib/` and `src/tst/` and keep `src/app/` minimal or absent when no concrete executable entrypoints are needed.

## Why the Split Matters

Without an explicit split, onboarding, governance, architecture, and implementation details drift into one another.
This template keeps those concerns reviewable and easier to evolve.
