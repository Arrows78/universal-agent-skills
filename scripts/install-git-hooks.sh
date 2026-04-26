#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

if [ ! -d ".git" ]; then
  echo "error: .git directory not found. Run this from a Git repository checkout." >&2
  exit 1
fi

mkdir -p .git/hooks

if [ -f .git/hooks/pre-commit ]; then
  echo "warning: existing pre-commit hook found, backing up to pre-commit.backup" >&2
  cp .git/hooks/pre-commit .git/hooks/pre-commit.backup
fi

cat > .git/hooks/pre-commit <<'HOOK'
zsh ./scripts/sync-agent-mirrors.sh || exit 0

git add .claude/skills .cursor/skills .opencode/skills .agents/skills
HOOK

chmod +x .git/hooks/pre-commit
echo "Installed .git/hooks/pre-commit"
