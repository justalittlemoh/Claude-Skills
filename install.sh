#!/usr/bin/env bash
# Installiert Maurices Claude-Skills nach ~/.claude/skills.
# Aufruf: bash install.sh   (mehrfaches Ausführen ist unproblematisch)
set -euo pipefail

HIER="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZIEL="${HOME}/.claude/skills"
mkdir -p "$ZIEL"

# 1) Skills, die direkt in diesem Repo liegen (z. B. impeccable)
for skill in "$HIER"/skills/*/; do
  name="$(basename "$skill")"
  rm -rf "${ZIEL:?}/$name"
  cp -R "$skill" "$ZIEL/$name"
  echo "Skill installiert: $name"
done

# 2) gstack (github.com/garrytan/gstack): zu gross zum Einchecken,
#    wird deshalb in einer festen Version geladen und eingerichtet.
GSTACK_COMMIT="64795163af36f9129b5d8b32627ace4f7ac39292"  # Version 1.102.0.0
if [ ! -f "$ZIEL/gstack/VERSION" ]; then
  git clone --single-branch https://github.com/garrytan/gstack.git "$ZIEL/gstack"
  git -C "$ZIEL/gstack" checkout -q "$GSTACK_COMMIT" || echo "Hinweis: Commit nicht gefunden, nutze neueste Version."
  (cd "$ZIEL/gstack" && ./setup --no-browser --no-skill-contracts)
else
  echo "gstack ist schon installiert: $(cat "$ZIEL/gstack/VERSION")"
fi
