# Review Protocol

## Purpose

Provide a neutral, findings-first, decision-ready review of software, documentation, planning, and operations artifacts.

## Core Rules (MUST)

- findings first
- concise, high-signal output
- no workaround or retrospective language in descriptive docs
- governed textual artifacts do not use emojis
- reviews are read-only by default unless implementation is explicitly approved

## Minimum Review Scope (MUST)

- software structure and deterministic checks
- documentation freshness, routing accuracy, and terminology consistency
- planning and approval-contract compliance
- handover and operations usability where relevant

## Documentation Checks (MUST)

- `doc/usr/*`, `doc/agn/*`, and `doc/arc/*` use the documented taxonomy correctly
- `doc/agn/source-map.md` stays accurate
- accepted tasks use:
  - `# Content`
  - `## Plan`
  - one fenced `/plan ...` block under `## Plan`
