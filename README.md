# Claude-Skills

Skills für Claude Code, die in jeder Session verfügbar sein sollen.

| Skill | Quelle | Lizenz | Wie er hierher kommt |
|---|---|---|---|
| impeccable 4.10.0 | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Apache 2.0 | liegt in `skills/impeccable` |
| gstack 1.102.0.0 | [garrytan/gstack](https://github.com/garrytan/gstack) | MIT | `install.sh` lädt ihn in einer festen Version |

## Installation

```bash
bash install.sh
```

Das Skript kopiert alles aus `skills/` nach `~/.claude/skills` und richtet gstack ein
(ohne eigenen Browser; den bei Bedarf mit `cd ~/.claude/skills/gstack && ./setup` nachholen).

## Eigenen Skill hinzufügen

Einen Ordner `skills/<name>/` mit einer `SKILL.md` anlegen. Beim nächsten `install.sh` ist er installiert.
