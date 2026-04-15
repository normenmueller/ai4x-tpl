# Accepted Task Template

Use this file as the canonical template when a proposal is approved and moved from `adm/pln/assessed/` to `adm/pln/accepted/`.

This template is intentionally stored inside `adm/pln/accepted/` as the one allowed helper artifact in that folder.
Do not treat `_template.md` as an active `Task`.

```yaml
---
kind: Task
status: open
priority: none
title: "[area] task title"
author:
  - {{MAINTAINER_NAME}}
version: 0.1.0
dateCreated: {{INITIAL_TIMESTAMP}}
dateModified: {{INITIAL_TIMESTAMP}}
---
```

# Content

Describe the approved implementation target clearly and concisely.

## Plan

```text
/plan Build a professional implementation plan for [area] task title. Target state: <approved target state>. Scope: <in-scope work only>. Affected modules/interfaces: <only when relevant>. Acceptance/verification: <relevant gates or acceptance criteria>.
```
