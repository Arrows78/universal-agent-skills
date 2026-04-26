#!/usr/bin/env zsh
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
REPO_ROOT="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

INTERVAL_SECONDS="${SYNC_INTERVAL_SECONDS:-2}"

hash_skills() {
  find skills -type f -print | LC_ALL=C sort | while IFS= read -r file; do
    shasum -a 256 "$file"
  done | shasum -a 256 | awk '{print $1}'
}

zsh "$SCRIPT_DIR/sync-agent-mirrors.sh"
last_hash="$(hash_skills)"

echo "Watching skills/ for changes. Press Ctrl-C to stop."
echo "Polling every ${INTERVAL_SECONDS}s. Override with SYNC_INTERVAL_SECONDS=1."

while :; do
  sleep "$INTERVAL_SECONDS"
  current_hash="$(hash_skills)"
  if [ "$current_hash" != "$last_hash" ]; then
    zsh "$SCRIPT_DIR/sync-agent-mirrors.sh"
    last_hash="$current_hash"
  fi
done
