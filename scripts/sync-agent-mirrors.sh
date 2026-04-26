#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

if [ ! -d "skills" ]; then
  echo "error: skills/ directory not found" >&2
  exit 1
fi

targets=(
  ".claude/skills"
  ".cursor/skills"
  ".opencode/skills"
  ".agents/skills"
)

for target in "${targets[@]}"; do
  rm -rf "$target"
  mkdir -p "$target"
  cp -R skills/. "$target"/
done

echo "Synced skills/ to: ${targets[*]}"
