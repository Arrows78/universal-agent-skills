---
name: issue-tracker
description: Draft and improve issue tracker entries for product management: bug reports and user stories. Use when filing bugs, documenting defects, writing reproduction steps, creating backlog items, user stories, acceptance criteria, gherkin scenarios, or preparing descriptions for product and engineering teams.
---

# Issue Tracker Writer

## Purpose

Draft issue tracker entries (bugs, user stories, tasks) that help Engineering reproduce, understand, and prioritize work. Works with any platform: Jira, Linear, YouTrack, Azure DevOps, GitHub Issues, GitLab Issues, Plane, Redmine.

## Bug reports

### Workflow

1. Identify the affected surface, user role, environment, data conditions, and severity signal.
2. Write a short title that names the broken behavior.
3. Fill the standard description template.
4. Make reproduction steps ordered and concrete.
5. Separate actual behavior from expected behavior.
6. Add screenshots, logs, HAR files, links, account IDs, or feature flags when provided.
7. Mark unknowns explicitly instead of inventing details.

### Language and style

- Write the description in the project's working language by default (match the user's language).
- Keep steps reproducible and observable.
- Avoid blaming language and speculation.
- Do not include secrets, raw tokens, passwords, private customer data, or unnecessary personal data.
- Do not add AI signatures or generated-by footers.

### Default output

Return two blocks when useful:

1. `Title`: a concise bug summary.
2. `Description`: the full Markdown body.

Use `references/bug-report-template.md` for the exact template and `references/examples.md` for examples.

---

## User stories

### Workflow

1. Identify the user, need, product outcome, affected surface, and scope.
2. Write a concise summary separately when useful.
3. Fill the description with the standard template.
4. Convert vague behavior into testable acceptance criteria.
5. Add tracking, wireframes, localization, and open questions when relevant.
6. Mark missing information explicitly instead of inventing details.

### Language and style

- Write the description in the project's working language by default.
- Use natural product language, not implementation jargon.
- Keep headings stable so the text can be pasted into the issue tracker.
- Use Gherkin-style acceptance criteria when appropriate: `Given`, `When`, `Then` (or localized equivalents).
- Do not add AI signatures or generated-by footers.

### Default output

Return two blocks when useful:

1. `Title`: a short, action-oriented summary.
2. `Description`: the full Markdown body.

Use `references/user-story-template.md` for the exact template and `references/examples.md` for examples.

---

## Quality gate

Before finalizing, check that:

- The title names the broken behavior or expected outcome clearly.
- Reproduction steps are numbered or ordered.
- Actual and expected behavior are not mixed.
- Environment and role are included when known.
- Attachments or links are referenced when available.
- The report avoids sensitive data.
- For user stories: actor, capability, and outcome are clear.
- For user stories: acceptance criteria are observable and testable.
