# UAT Runbook

## Purpose

Define the minimum reproducible user-acceptance path before release or wider rollout.

## Default Sequence

1. run `{{DEFAULT_VERIFY_CMD}}`
2. run `{{DEFAULT_SMOKE_TEST}}`
3. record result, blocker, or follow-up decision in `adm/ops/reports/review.md`
