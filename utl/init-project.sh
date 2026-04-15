#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ENV_FILE=""

usage() {
  cat <<'USAGE'
Usage:
  bash ./utl/init-project.sh [--env PATH]

Options:
  --env PATH   load initialization values from a .env-style file
  -h, --help   show this help text
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --env)
      [[ $# -ge 2 ]] || { printf '[tpl|ERROR]: missing value for --env\n' >&2; exit 1; }
      ENV_FILE="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf '[tpl|ERROR]: unknown argument: %s\n' "$1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ -n "$ENV_FILE" ]]; then
  [[ -f "$ENV_FILE" ]] || { printf '[tpl|ERROR]: env file not found: %s\n' "$ENV_FILE" >&2; exit 1; }
  set -a
  # shellcheck disable=SC1090
  . "$ENV_FILE"
  set +a
fi

slugify() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/-+/-/g'
}

iso_now() {
  local ts
  ts="$(date '+%Y-%m-%dT%H:%M:%S%z')"
  printf '%s:%s' "${ts%??}" "${ts: -2}"
}

prompt_with_default() {
  local var_name="$1"
  local prompt_label="$2"
  local default_value="$3"
  local current_value="${!var_name:-}"
  local reply=""

  if [[ -n "$current_value" ]]; then
    return 0
  fi

  printf '%s [%s]: ' "$prompt_label" "$default_value"
  read -r reply
  if [[ -n "$reply" ]]; then
    printf -v "$var_name" '%s' "$reply"
  else
    printf -v "$var_name" '%s' "$default_value"
  fi
  export "$var_name"
}

prompt_with_default PROJECT_NAME "Project name" "My Project"
PROJECT_SLUG_DEFAULT="$(slugify "${PROJECT_NAME}")"
prompt_with_default PROJECT_SLUG "Project slug" "$PROJECT_SLUG_DEFAULT"
prompt_with_default MAINTAINER_NAME "Maintainer name" "maintainer"
prompt_with_default DEFAULT_BRANCH "Default branch" "trunk"
prompt_with_default INITIAL_TIMESTAMP "Initial timestamp" "$(iso_now)"
prompt_with_default DEFAULT_VERIFY_CMD "Default verify command" "make verify"
prompt_with_default DEFAULT_SMOKE_TEST "Default smoke-test command" "$DEFAULT_VERIFY_CMD"

required_vars=(
  PROJECT_NAME
  PROJECT_SLUG
  MAINTAINER_NAME
  DEFAULT_BRANCH
  INITIAL_TIMESTAMP
  DEFAULT_VERIFY_CMD
  DEFAULT_SMOKE_TEST
)

for var_name in "${required_vars[@]}"; do
  if [[ -z "${!var_name:-}" ]]; then
    printf '[tpl|ERROR]: required value missing: %s\n' "$var_name" >&2
    exit 1
  fi
done

replace_placeholder() {
  local placeholder="$1"
  local replacement="$2"
  shift 2
  PLACEHOLDER="$placeholder" REPLACEMENT="$replacement" perl -0pi -e 's/\Q$ENV{PLACEHOLDER}\E/$ENV{REPLACEMENT}/g' "$@"
}

placeholder_files=()
while IFS= read -r placeholder_file; do
  placeholder_files+=("$placeholder_file")
done < <(
  grep -RIl '{{[A-Z0-9_][A-Z0-9_]*}}' "$ROOT_DIR" \
    --exclude='init-project.sh' \
    --exclude='init-project.example.env' \
    --exclude-dir='.git'
)

if [[ ${#placeholder_files[@]} -eq 0 ]]; then
  printf '[tpl|INFO]: no unresolved template placeholders found\n'
else
  replace_placeholder '{{PROJECT_NAME}}' "$PROJECT_NAME" "${placeholder_files[@]}"
  replace_placeholder '{{PROJECT_SLUG}}' "$PROJECT_SLUG" "${placeholder_files[@]}"
  replace_placeholder '{{MAINTAINER_NAME}}' "$MAINTAINER_NAME" "${placeholder_files[@]}"
  replace_placeholder '{{DEFAULT_BRANCH}}' "$DEFAULT_BRANCH" "${placeholder_files[@]}"
  replace_placeholder '{{INITIAL_TIMESTAMP}}' "$INITIAL_TIMESTAMP" "${placeholder_files[@]}"
  replace_placeholder '{{DEFAULT_VERIFY_CMD}}' "$DEFAULT_VERIFY_CMD" "${placeholder_files[@]}"
  replace_placeholder '{{DEFAULT_SMOKE_TEST}}' "$DEFAULT_SMOKE_TEST" "${placeholder_files[@]}"
fi

VERIFY_WORKFLOW="$ROOT_DIR/.github/workflows/verify.yml"
if [[ -f "$VERIFY_WORKFLOW" ]]; then
  replace_placeholder 'branches: [trunk]' "branches: [$DEFAULT_BRANCH]" "$VERIFY_WORKFLOW"
  replace_placeholder 'run: make verify' "run: $DEFAULT_VERIFY_CMD" "$VERIFY_WORKFLOW"
fi

printf '[tpl|INFO]: initialized project metadata for %s\n' "$PROJECT_NAME"
printf '[tpl|INFO]: verify command: %s\n' "$DEFAULT_VERIFY_CMD"
printf '[tpl|INFO]: smoke test command: %s\n' "$DEFAULT_SMOKE_TEST"
