.PHONY: sync watch install-hooks clean help

help:
	@echo "Available targets:"
	@echo "  make sync          - sync skills/ to agent mirror folders"
	@echo "  make watch        - watch and auto-sync on changes"
	@echo "  make install-hooks - install git hooks"
	@echo "  make clean        - remove generated folders"

sync:
	zsh ./scripts/sync-agent-mirrors.sh

watch:
	zsh ./scripts/watch-agent-skills.sh

install-hooks:
	zsh ./scripts/install-git-hooks.sh

clean:
	rm -rf .claude/skills .cursor/skills .opencode/skills .agents/skills
