# {{PROJECT_NAME}}

> [ai4X](https://github.com/normenmueller/ai4x)-driven, minimal single-repo template for agent-first development and agent-guided documentation.

ai4x-tpl is an [ai4X](https://github.com/normenmueller/ai4x)-driven, minimal single-repo template for projects that want a strict **agent-first development model** and an **agent-guided documentation model** for human-facing onboarding and support.

<details>
<summary>This template is intentionally minimal, but it preserves the core governance and documentation model behind ai4X.</summary>

This template applies a strict **agent-first development model**.

Consequences:

- Deterministic checks are handled programmatically through shell checks, project tests, and local verification commands.
- Higher-order planning, review, and handover are intentionally designed for execution with agentic AI actors.
- Therefore:
  - `doc/usr/*` is the direct human-facing documentation surface.
  - `doc/agn/*` is the agent-facing routing and onboarding surface that operationalizes the agent-guided documentation model for human-facing onboarding and support.
  - `doc/arc/*` is human-readable architecture and system-reference documentation.
  - `adm/dev/*` is development governance.
  - `adm/ops/*` is operations governance.
- The repository stays intentionally single-repo and minimal.
- It preserves an ai4X-inspired governance and documentation model without imposing the ai4X suite-specific module split, submodule mechanics, or capability portfolios.

That same model is why this template is useful as more than a bare scaffold: it gives new projects a reusable starting point for governed agent-first development and documentation-first routing.

In practice, that means:

- this repository stays intentionally single-repo and minimal
- it preserves the governance and documentation model in a reusable starter form
- it preserves the planning, routing, and verification discipline proven in ai4X
- it aligns new projects with the same governed development model that underpins ai4X's curated agent and runtime architecture
- it stays structurally small while remaining compatible with the broader ai4X approach as projects grow
- the language-agnostic source layout stays centered on `src/lib` and `src/tst`, with `src/app` used only when the repository needs concrete entrypoints or adapters
- for the full modular reference implementation of the same model, see [ai4X](https://github.com/normenmueller/ai4x)

</details>

# For Humans

Copy and paste this prompt to your LLM agent:

```text
Guide me through this project template by following these sources in order:
1. https://raw.githubusercontent.com/normenmueller/ai4x-tpl/trunk/doc/agn/user-onboarding.md
2. https://raw.githubusercontent.com/normenmueller/ai4x-tpl/trunk/doc/usr/primer.md
3. https://raw.githubusercontent.com/normenmueller/ai4x-tpl/trunk/INSTALL
Then explain the structure briefly, walk me through initialization, and tell me the best next step.
```

# For Agents

Use this bootstrap prompt when entering ai4x-tpl from a local checkout or from GitHub:

```text
You are entering ai4x-tpl for governed work.
If you have a local checkout, use the local equivalents of these sources. Otherwise fetch them directly:
1. https://raw.githubusercontent.com/normenmueller/ai4x-tpl/trunk/AGENTS.md
2. https://raw.githubusercontent.com/normenmueller/ai4x-tpl/trunk/adm/dev/protocols/workflow.md
3. https://raw.githubusercontent.com/normenmueller/ai4x-tpl/trunk/CONTRIBUTING.md
4. https://raw.githubusercontent.com/normenmueller/ai4x-tpl/trunk/INSTALL
5. https://raw.githubusercontent.com/normenmueller/ai4x-tpl/trunk/doc/agn/maintainer-onboarding.md
6. https://raw.githubusercontent.com/normenmueller/ai4x-tpl/trunk/doc/agn/source-map.md
Then summarize the repository structure, tell me which protocol applies to the current task, and do not infer workflow from repository layout alone.
```

# License

See [LICENSE](./LICENSE).
