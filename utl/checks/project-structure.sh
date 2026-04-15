#!/usr/bin/env bash
set -euo pipefail

required_paths=(
  "AGENTS.md"
  "README.md"
  "INSTALL"
  "CONTRIBUTING.md"
  "SECURITY.md"
  "CHANGELOG"
  "LICENSE"
  "Makefile"
  ".github/workflows/verify.yml"
  "adm/dev/protocols/workflow.md"
  "adm/dev/protocols/proposal-assessment.md"
  "adm/dev/protocols/approval-transition.md"
  "adm/dev/protocols/review.md"
  "adm/dev/protocols/handover.md"
  "adm/pln/accepted/_template.md"
  "adm/pln/inbox/_template.md"
  "adm/pln/rdmp.md"
  "doc/usr/primer.md"
  "doc/agn/user-onboarding.md"
  "doc/agn/maintainer-onboarding.md"
  "utl/init-project.sh"
  "utl/init-project.example.env"
  "doc/agn/governance-model.md"
  "doc/agn/source-map.md"
  "doc/arc/arc42.md"
  "src/lib"
  "src/tst"
)

for path in "${required_paths[@]}"; do
  [[ -e "$path" ]] || { echo "[tpl|ERROR]: missing required path $path"; exit 1; }
done

grep -q '^# Content$' adm/pln/accepted/_template.md || { echo "[tpl|ERROR]: accepted-task template misses # Content"; exit 1; }
grep -q '^## Plan$' adm/pln/accepted/_template.md || { echo "[tpl|ERROR]: accepted-task template misses ## Plan"; exit 1; }
grep -q '^/plan ' adm/pln/accepted/_template.md || { echo "[tpl|ERROR]: accepted-task template misses /plan prompt"; exit 1; }

echo "[tpl|INFO]: project structure contract: ok"
