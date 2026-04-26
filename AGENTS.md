# Agent guidance

This repository contains portable Agent Skills in the `SKILL.md` format.

## General response style

- Be concise, direct, and specific.
- Do not add generated-by or AI-tool signatures.
- Prefer ASCII punctuation in code, paths, JSON, YAML, shell commands, commit messages, and technical docs.
- Preserve exact user-provided strings, API payloads, tests, and localized UI copy when required.
- When a skill matches the task, load and follow that skill before improvising.

## Skill layout

Canonical skills live in:

```text
skills/<skill-name>/SKILL.md
```

Mirror folders (generated, do not edit manually):

```text
.claude/skills/
.cursor/skills/
.opencode/skills/
```

`scripts/sync-agent-mirrors.sh` also merges each skill into `~/.claude/skills`, `~/.cursor/skills`, and `~/.config/opencode/skills` unless `CI` or `UAS_SKIP_HOME_SYNC` is set. Repo mirrors still include `.agents/skills/` (not synced to `$HOME`).
