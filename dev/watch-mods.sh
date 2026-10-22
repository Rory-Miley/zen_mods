#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

"$SCRIPT_DIR/sync-mods.sh" "$@"

echo ""
echo "Watching for changes to */chrome.css and */theme.json (Ctrl+C to stop)..."

OS_NAME="$(uname -s)"
get_hash() {
  if [[ "$OS_NAME" == "Darwin" ]]; then
    find "$REPO_ROOT" -maxdepth 2 \( -name "chrome.css" -o -name "theme.json" \) -exec stat -f "%m %N" {} + 2>/dev/null | shasum
  else
    find "$REPO_ROOT" -maxdepth 2 \( -name "chrome.css" -o -name "theme.json" \) -exec stat -c "%Y %n" {} + 2>/dev/null | sha256sum
  fi
}

LAST_HASH=""
while true; do
  CURRENT_HASH="$(get_hash)"
  if [[ -n "$LAST_HASH" && "$CURRENT_HASH" != "$LAST_HASH" ]]; then
    echo ""
    echo "[$(date '+%H:%M:%S')] Change detected — syncing mods..."
    "$SCRIPT_DIR/sync-mods.sh" "$@"
  fi
  LAST_HASH="$CURRENT_HASH"
  sleep 1
done
