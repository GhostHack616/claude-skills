#!/usr/bin/env bash
# Symlinks every SKILL.md folder under bulldozer/, noelse/, tools/ into ~/.claude/skills/
# Idempotent: re-running updates symlinks. Skips folders without a SKILL.md.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${HOME}/.claude/skills"
mkdir -p "$TARGET"

linked=0
skipped=0
overwritten=0

for skill_dir in "$REPO_ROOT"/{bulldozer/meta-ads,bulldozer/google-ads,noelse,tools}/*/; do
  [ -d "$skill_dir" ] || continue
  [ -f "$skill_dir/SKILL.md" ] || { skipped=$((skipped+1)); continue; }
  name="$(basename "$skill_dir")"
  link="$TARGET/$name"

  if [ -L "$link" ]; then
    rm "$link"
    overwritten=$((overwritten+1))
  elif [ -e "$link" ]; then
    echo "WARN: $link exists and is not a symlink — skipping (move it manually if you want it replaced)"
    skipped=$((skipped+1))
    continue
  fi

  ln -s "${skill_dir%/}" "$link"
  echo "  linked $name -> ${skill_dir%/}"
  linked=$((linked+1))
done

echo
echo "Done. linked=$linked overwritten=$overwritten skipped=$skipped"
echo "Skills available at: $TARGET"
