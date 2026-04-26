---
name: conventional-commit
description: Create, review, and improve git commit messages using conventional commits, including platform-friendly issue references. Use when the user asks to write, validate, split, or improve commit messages, choose commit types or scopes, prepare release-friendly history, format PR titles, or enforce conventional commit practices.
---

# Conventional Commit

## Purpose

Create clean, release-friendly commit messages that follow Conventional Commits and remain useful in code review, changelogs, and any platform (GitHub, GitLab, Bitbucket, Forgejo, Gitea).

## Workflow

1. Identify the logical change from the user's description, diff, staged files, issue, PR, or product goal.
2. Decide whether the work should be one commit or split into multiple commits.
3. Choose the narrowest valid type and an optional stable scope.
4. Write a short imperative subject that explains the outcome, not the editing activity.
5. Add a body only when it clarifies motivation, tradeoffs, migration notes, or product impact.
6. Add footers for breaking changes, issue references, or platform automation.
7. Never put co-authors in the PR.
8. Validate the message against the quality gate before returning it.

When tools are available and the user asks to actually commit, inspect the working tree first. Prefer committing only staged files unless the user explicitly asks to stage changes. Never include secrets, generated noise, local config, or unrelated formatting in the same commit.

## Commit format

```text
<type>[optional scope][!]: <description> #<ticket>

[optional body]

[optional footer(s)]
```

Subject rules:

- Use a valid type: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, or `revert`.
- Use an optional scope only when it improves scanning.
- Keep the description imperative, specific, lowercase after the type, and without a trailing period.
- Prefer 50-72 characters for the subject when possible.

## Platform issue references

If the user provides a ticket ID, issue number, or work item, include it only when it helps the team workflow.

Preferred patterns:

```text
feat(onboarding): add setup checklist #DEV-123

Refs #DEV-123
```

```text
fix(exports): escape quoted csv values

Closes #42
```

Use `#DEV-123` into the subject as the commit convention requires it. Keep automation keywords such as `Closes`, `Fixes`, and `Refs` in the footer when possible.

See `references/platform-integration.md` and `references/examples.md` when platform-specific detail or examples are needed.

## Type selection

| Type | Use for |
| --- | --- |
| `feat` | User-facing feature, capability, behavior, or API addition. |
| `fix` | Bug fix, regression, incorrect behavior, or production issue. |
| `docs` | Documentation only. |
| `style` | Formatting or whitespace without behavior change. |
| `refactor` | Internal restructuring without behavior change. |
| `perf` | Performance improvement. |
| `test` | Tests, fixtures, or test infrastructure. |
| `build` | Build system, package manager, dependencies, or bundling. |
| `ci` | CI/CD configuration and automation. |
| `chore` | Maintenance that does not fit another type. |
| `revert` | Reverting a previous commit. |

Prefer `feat` or `fix` when the change affects users. Do not use `chore` as a catch-all when a more precise type applies.

## Splitting guidance

Propose separate commits when the diff mixes independent concerns, for example:

- Product behavior plus unrelated refactor.
- Code change plus broad formatting.
- Feature implementation plus follow-up tests for another area.
- Dependency upgrades plus application changes.

Return suggested file groupings when the user needs help splitting staged or unstaged work.

## Breaking changes

Use `!` and a `BREAKING CHANGE:` footer when consumers, users, admins, or integrators must adapt.

```text
feat(api)!: require workspace id for export requests

BREAKING CHANGE: export requests must now include workspace_id.
```

## Output modes

- For a commit message request, return the final message in a code block, then one short rationale if useful.
- For a review request, return pass or fail, the corrected message, and the rule that changed.
- For multiple unrelated changes, propose separate commits with file grouping and messages.
- For an actual commit command, provide or execute commands only when the user clearly requested it.

## Quality gate

Before finalizing, check that:

- The type is valid and specific.
- The scope is useful and stable when present.
- The subject explains what changed, not the process of changing it.
- The subject has no trailing period.
- The message is understandable from the commit log alone.
- Breaking changes are explicit.
- Issue references are correctly formatted and not misleading.
- The commit does not mix unrelated product, refactor, docs, and test changes unless intentionally bundled.
