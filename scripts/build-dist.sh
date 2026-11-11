#!/usr/bin/env bash
# Rebuilds dist/<plugin>.zip for every plugin: one zip per block, containing the
# skill folders at its root, ready to unzip into <repo>/.claude/skills/.
# Usage: scripts/build-dist.sh
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$REPO_ROOT/dist"
mkdir -p "$DIST"
rm -f "$DIST"/*.zip

for plugin_dir in "$REPO_ROOT"/plugins/*/; do
  plugin="$(basename "$plugin_dir")"
  [ -d "$plugin_dir/skills" ] || continue
  (cd "$plugin_dir/skills" && zip -q -r -X "$DIST/$plugin.zip" . -x '*.DS_Store')
  echo "  dist/$plugin.zip  ($(ls "$plugin_dir/skills" | wc -l | tr -d ' ') skills)"
done
