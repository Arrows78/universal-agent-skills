---
name: pull-request
description: Build, review, and improve structured pull request or merge request descriptions. Use when opening code review requests, writing summaries, preparing review checklists, documenting testing steps, linking issues, describing rollout notes, or turning diffs and tickets into reviewer-ready pr text.
---

# Pull Request Writer

## Purpose

Create pull request (PR) or merge request (MR) descriptions that help reviewers quickly understand intent, scope, risk, and validation. Works with any platform: GitHub, GitLab, Bitbucket, Azure DevOps, Forgejo, Gitea.

## Workflow

1. Extract the product or technical intent from user notes, ticket, diff, branch name, commit list, or issue.
2. Separate user-facing behavior, technical changes, tests, rollout notes, and risks.
3. Omit irrelevant sections for small changes; mark unknowns as `N/A` only when the template requires it.
4. Use platform-appropriate issue keywords (e.g., `Closes`, `Fixes`, `Refs` for GitLab; `Closes`, `Fixes`, `Resolves` for GitHub; or your team's convention).
5. Keep the description high-signal: do not duplicate the full diff.
6. Add reviewer-specific testing steps that can actually be followed.

## Default template

Use this structure unless the repository has its own PR template.

```markdown
## Summary

[2-4 sentences: what this PR does, why it matters, and the affected area.]

## Changes

- [High-level change]
- [High-level change]

## How to test

1. [Step]
2. [Step]
3. [Expected result]

## Screenshots or recordings

[N/A unless UI changed.]

## Related issues

- Closes #[id]

## Deployment and rollout notes

[N/A unless there are flags, migrations, env vars, monitoring, or ordering constraints.]
```

See `references/pr-template.md` for variants

## Optional sections

Add these only when they reduce review risk:

- `Architecture / approach` for large technical changes.
- `Risks and mitigations` for migrations, payment, auth, data, or permissions.
- `Backward compatibility` for API, schema, or event changes.
- `Analytics / tracking` when tracking changes are included.
- `Release notes` for customer-visible behavior.

## Quality gate

Before finalizing, check that:

- The summary explains why the change exists.
- The change list is review-level, not file-level noise.
- Testing steps are reproducible.
- UI changes mention screenshots or recordings.
- Deployment notes include migrations, flags, env vars, or monitoring when relevant.
- Related issues use the correct platform syntax.
- The text does not include AI signatures or tool-generated footers.
