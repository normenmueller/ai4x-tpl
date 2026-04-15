# Development Workflow

## Purpose

Route development work in this repository to the correct execution protocol.
Use `AGENTS.md` first, this file second, and the task-specific protocol third.

## Documentation and Governance Taxonomy (MUST)

1. `doc/usr/*` = direct human-facing documentation
2. `doc/agn/*` = agent-facing onboarding and routing documentation
3. `doc/arc/*` = architecture and system-reference documentation
4. `doc/*` = explanation and reference
5. `adm/dev/*` = development governance
6. `adm/ops/*` = operations governance
7. `adm/pln/*` = planning lifecycle artifacts

Normative interpretation rule (MUST):

- `doc/*` is descriptive documentation.
- `adm/dev/*` and `adm/ops/*` are normative governance surfaces.
- `doc/agn/*` may explain governance, but must not replace or overrule it.

## Protocol Map (MUST)

- planning intake -> `adm/dev/protocols/proposal-assessment.md`
- planning transition -> `adm/dev/protocols/approval-transition.md`
- review -> `adm/dev/protocols/review.md`
- handover -> `adm/dev/protocols/handover.md`

## Planning Contract (MUST)

1. `adm/pln/inbox/` contains only `Proposal` with `status: draft`.
2. `adm/pln/assessed/` contains only `Proposal` with `status: assessed`.
3. `adm/pln/accepted/` contains `Task` artifacts with `status: none|open|wip|blocked` plus the single reserved helper file `adm/pln/accepted/_template.md`.
4. `adm/pln/rejected/` and `adm/pln/realized/` contain only `status: done` artifacts.
5. No transition into `accepted/` and no roadmap change without explicit approval.
6. Proposal assessment must end with an explicit decision proposal.
7. Every future `assessed -> accepted` transition must produce an accepted task with:
   - `# Content`
   - `## Plan`
   - one fenced text block under `## Plan`
   - one directly copy-pasteable `/plan ...` prompt in that fenced text block
8. The `/plan` prompt must be short, direct, and derived from the approved proposal rather than from the title alone.

## Consistency Before Commit (MUST)

1. run relevant deterministic gates
2. sync documentation when contracts, structures, or behaviors changed
3. validate canonical routing after documentation moves
4. keep descriptive docs in target-state voice
5. keep governed textual artifacts emoji-free
