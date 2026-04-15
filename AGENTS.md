---
name: project-template
description: "Use this agent to govern an agent-first project with explicit bootstrap, documentation taxonomy, planning discipline, and deterministic verification."
---

# AGENTS

This document is the bootstrap contract for agentic work in this project.
It defines reading order, rule priority, documentation taxonomy, and routing into the correct governance path.
Detailed execution steps do not live here.
Use `adm/dev/protocols/workflow.md` after this file.

## Bootstrap Chain (MUST)

- `AGENTS.md` alone is not sufficient for governed development work.
- After `AGENTS.md`, `adm/dev/protocols/workflow.md` must always be read.
- After `workflow.md`, the required task-specific protocol must be loaded before substantial planning, review, or implementation begins.
- Work that skips this chain is governance-invalid.

## Conflict Order (MUST)

1. system and platform constraints plus safety rules
2. explicit user goal and hard user constraints
3. `AGENTS.md`
4. loaded cognitive rules and capabilities
5. style and phrasing preferences

If rules conflict, the stricter MUST rule wins.

## Documentation and Governance Model (MUST)

- `doc/usr/*` is the direct human-facing documentation surface.
- `doc/agn/*` is the agent-facing onboarding and navigation surface.
- `doc/arc/*` is human-readable architecture and system-reference documentation.
- `doc/*` explains and references.
- `adm/dev/*` is agent-facing development governance.
- `adm/ops/*` is agent-facing operations governance.
- `adm/*` governs, routes, checks, and operationalizes.
- `AGENTS.md` is the bootstrap contract.
- `adm/dev/protocols/workflow.md` is the process router.
- Task-specific files under `adm/dev/protocols/` are the execution contracts.

Normative interpretation rule (MUST):

- `doc/*` is descriptive documentation.
- `adm/dev/*` and `adm/ops/*` are normative governance surfaces.
- `doc/agn/*` may explain governance, but it must not replace, redefine, or overrule governance.
- If explanatory and normative sources diverge, `AGENTS.md`, `adm/dev/protocols/workflow.md`, the active development protocols, and `adm/ops/*` win.

## Quality Model (MUST)

Two quality layers apply in parallel:

1. Deterministic gates
- tests
- shell checks
- deterministic validation commands such as `verify`
- machine-checkable layout and reference validation

2. Semantic development protocols
- proposal assessment
- planning transition
- review
- handover

Not everything important is programmatically checkable.
Higher-order semantic judgments must still be documented reproducibly.

## Architecture and Quality Rules (MUST)

- production-grade solutions only; no prototypes
- clear source boundaries and low coupling
- update documentation whenever contracts, structure, or behavior change
- write documentation in target-state voice; avoid workaround and retrospective language in descriptive docs
- governed textual artifacts do not use emojis; use plain text wording and headings instead

## Implementation Discipline (MUST)

- run relevant deterministic gates green before commit
- do not create commits with failing checks
- commit messages follow Conventional Commits
- commit messages are in English; the text after `:` starts lowercase
- if uncertain, do not guess; state the contradiction and ask targeted questions

## Reading Order (MUST)

### For Development Work

1. `AGENTS.md`
2. `adm/dev/protocols/workflow.md`
3. the required task-specific protocol under `adm/dev/protocols/`
4. affected `README.md` and `doc/arc/*`
5. affected `doc/usr/*` and `doc/agn/*` when explanatory context is needed

### For Operations and Delivery Work

1. `AGENTS.md`
2. `adm/ops/*`
3. relevant reports and runbooks

## Routing (MUST)

- new idea or planning intake -> `adm/dev/protocols/proposal-assessment.md`
- planning transition -> `adm/dev/protocols/approval-transition.md`
- review or quality verdict -> `adm/dev/protocols/review.md`
- handover or fresh-session continuity -> `adm/dev/protocols/handover.md`
- runtime, release, or maintainer operations -> `adm/ops/*`
