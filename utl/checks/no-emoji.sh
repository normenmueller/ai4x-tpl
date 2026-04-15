#!/usr/bin/env bash
set -euo pipefail

if rg -n '[\x{1F300}-\x{1FAFF}]' AGENTS.md README.md doc adm src utl -g '*.md' -g '*.sh' -g 'Makefile' >/tmp/tpl-emoji.out 2>/dev/null; then
  cat /tmp/tpl-emoji.out
  echo "[tpl|ERROR]: governed text contains emojis"
  exit 1
fi

echo "[tpl|INFO]: no-emoji check: ok"
