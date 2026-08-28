---
name: release-notes
description: Draft customer-facing release notes and changelog entries from shipped tickets, PRs, or sprint summaries. Use whenever the user asks for release notes, a changelog entry, a "what's new" post, in-app announcement copy, or any public-facing summary of shipped work — distinct from internal PR descriptions (pull-request) or team-facing sprint updates (sprint-announcement).
---

# Release Notes Writer

## Purpose

Turn shipped tickets, PRs, or a sprint summary into release notes that customers actually read — benefit-first, jargon-free, and organized by what changed for the user, not by ticket ID.

## Principles

- Lead with the user benefit, not the implementation. "Export reports as PDF" beats "Added PDF export endpoint."
- Group by theme or surface area, not by ticket order.
- Never expose internal ticket IDs, code names, or engineering jargon unless the tracker is public.
- Call out breaking changes, deprecations, and required user action before anything else.
- Match the audience: end users, admins, or developers reading an API changelog.
- Write in the product's public voice, not the internal team's voice.
- Do not mention AI tools or add generated-by signatures.

## Workflow

1. Gather the shipped scope: tickets, PR titles, a sprint summary, or a feature list.
2. Filter out internal-only changes (refactors, tests, tooling) unless the audience is developers reading an API changelog.
3. Group remaining items by user-facing theme or affected surface.
4. Write each entry benefit-first: what changed, why it matters, and how to use it.
5. Flag breaking changes, deprecations, and migration steps separately and prominently.
6. Add links to docs, support, or in-app entry points when available.
7. Match length and tone to the channel (in-app widget vs. blog vs. email vs. API changelog).

## Output modes

- **In-app "what's new"**: short, scannable bullets, 1-2 lines each.
- **Changelog / blog page**: grouped sections with short intros, screenshots optional.
- **Customer email or announcement**: lead with the single biggest change, why before what.
- **API / developer changelog**: versioned, each entry tagged `Added`, `Changed`, `Deprecated`, `Removed`, `Fixed`, `Security` (Keep a Changelog style); breaking changes always called out first.

See `references/release-notes-templates.md` for a template per output mode and `references/examples.md` for before/after rewrites.

## Quality gate

Before finalizing, check that:

- Every entry states the user benefit, not just the mechanism.
- No internal ticket IDs, code names, or engineering jargon leak into customer-facing text (unless the tracker itself is public).
- Breaking changes and required actions are impossible to miss.
- Entries are grouped by theme, not dumped as a flat ticket list.
- Tone and length match the channel.
- Links to docs or support are included when the change needs more context.
