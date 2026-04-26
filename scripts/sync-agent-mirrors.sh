#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

if [ ! -d "skills" ]; then
  echo "error: skills/ directory not found" >&2
  exit 1
fi

merge_skills_into() {
  local dest="${1:A}"
  if [[ -z "$dest" || "$dest" == "/" ]]; then
    echo "error: invalid merge destination" >&2
    return 1
  fi
  if [[ "$dest" == "$HOME" || "$dest" == "${HOME:A}" ]]; then
    echo "error: merge destination must be a subdirectory, not \$HOME" >&2
    return 1
  fi
  mkdir -p "$dest"
  local skill name
  for skill in "$REPO_ROOT"/skills/*(N/); do
    name="${skill:t}"
    rm -rf "$dest/$name"
    cp -R "$skill" "$dest/$name"
  done
  echo "Merged skills/ (per-skill) into: $dest"
}

sync_user_default_skill_dirs() {
  if [[ -n "${UAS_SKIP_HOME_SYNC:-}" ]]; then
    echo "Skipping user-level skill sync (UAS_SKIP_HOME_SYNC is set)."
    return 0
  fi
  if [[ -n "${CI:-}" ]]; then
    return 0
  fi
  local dirs=(
    "${HOME}/.claude/skills"
    "${HOME}/.cursor/skills"
    "${HOME}/.config/opencode/skills"
  )
  local d
  for d in "${dirs[@]}"; do
    merge_skills_into "$d"
  done
}

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

sync_user_default_skill_dirs
