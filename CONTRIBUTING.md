# Contributing

## Development Entry

For governed development work, read these sources in order:

1. `AGENTS.md`
2. `adm/dev/protocols/workflow.md`
3. the required task-specific protocol under `adm/dev/protocols/`

Do not infer workflow from repository layout alone.

## Initialization

Before the first project-specific commit, initialize the bootstrap values:

```bash
bash ./utl/init-project.sh
```

## Quality Baseline

Before commit:

1. run `{{DEFAULT_VERIFY_CMD}}`
2. update documentation when contracts, structure, or behavior change
3. keep descriptive docs in target-state voice
4. keep governed textual artifacts emoji-free
