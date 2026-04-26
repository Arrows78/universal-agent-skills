# Universal Agent Skills

Portable skills for ChatGPT, Claude Code, OpenCode, and other agents that read `SKILL.md`.

## Source of truth

Edit only the canonical skills in `skills/<skill-name>/`.

Mirror folders (auto-generated via `make sync`):

```text
.claude/skills/
.cursor/skills/
.opencode/skills/
.agents/skills/
```

## Available skills

| Skill | Description |
|-------|-------------|
| conventional-commit | Create, review, and improve git commit messages using conventional commits |
| functional-spec-writer | Write functional specification documentation with Mermaid diagrams |
| issue-tracker | Draft bug reports and user stories for any issue tracker |
| pull-request | Build and review pull request or merge request descriptions |
| prd-writer | Write product requirements documents |
| sprint-announcement | Draft sprint announcements and updates |

## Usage

```bash
# Sync mirrors to all agents
make sync

# Watch for changes (live sync)
make watch

# Install git hooks
make install-hooks

# Clean generated mirrors
make clean
```

## Maintenance

Edit only files in `skills/<skill-name>/`. Never edit files in mirror folders directly—they are generated automatically.