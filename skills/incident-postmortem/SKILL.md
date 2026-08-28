---
name: incident-postmortem
description: Write blameless incident postmortems and formal incident register reports for production bugs, outages, or security-relevant issues — timeline, root cause, business impact (confidentiality/integrity/availability/traceability), roles, corrective and preventive actions, and a Majeur/Mineur conclusion. Use when the user needs a postmortem, incident report, retro on an outage or a bug that reached production, a root cause analysis, an incident register entry, or a "what went wrong and how we prevent it" writeup.
---

# Incident Postmortem

## Purpose

Produce a blameless postmortem that reconstructs what happened, why, and what changes so it can't happen the same way twice — focused on systems and process, never on individuals — and that doubles as a complete incident register entry (roles, formal timestamps, business impact, classification) without a second document.

## Principles

- Blameless: describe what the system and process allowed, not who made a mistake. Avoid naming individuals in the root cause; name roles or systems instead.
- Root cause, not proximate cause: keep asking "why" until you reach a systemic factor (missing test, missing alert, unclear ownership, unsafe default, contractual/vendor delay) rather than stopping at "a bug was deployed."
- Timeline uses timestamps and facts, not interpretation — interpretation goes in the root cause and conclusion sections.
- Every action item has an owner and a due date, or it will not happen.
- Assess business impact (confidentiality, integrity, availability, traceability, destruction) explicitly and honestly, even when the answer is "no impact" — a register entry with blank impact fields is not auditable.
- Severity is classified consistently — both the fast engineering scale (SEV1-4) and the formal Majeur/Mineur conclusion — so postmortems are comparable over time.
- Do not include customer PII, secrets, or raw tokens in the writeup.

## Workflow

1. Post the quick header early (duration so far, communication channels, who's responding, services impacted, current status) — it doesn't need to wait for resolution.
2. Once resolved, establish the timeline: detection, escalation, mitigation, and full resolution, each with a timestamp and source (alert, ticket, Slack message).
3. Identify the roles: who declared it, who led it, who owned communication, and who was on the resolution team.
4. Fill the formal journalisation dates: appearance, discovery, root cause identified, communicated, resolved, closed.
5. Classify the incident category and the impacted components/assets — check every box that applies, not just the obvious one.
6. Assess business impact across confidentiality, integrity, availability, traceability, and destruction — "Non" is a valid, expected answer for most incidents.
7. Quantify impact: users affected, duration, and any revenue, trust, or compliance impact.
8. Classify engineering severity using `references/severity-levels.md`.
9. Find the root cause using a "5 whys"-style chain, distinguishing the root cause from contributing factors — including organizational or contractual/vendor factors, not just technical ones.
10. Note what went well (fast detection, effective mitigation) alongside what didn't — a postmortem that is all negative discourages honest reporting next time.
11. List corrective actions (what was actually done to resolve it) separately from preventive actions (what stops recurrence), each with an owner and a due date.
12. Note customer communication sent, if any, and whether it was accurate and timely.
13. Conclude with the Majeur/Mineur classification (see the mapping in `references/severity-levels.md`) and a one-paragraph synthesis of the root causes by type (organizational, technical, contractual, human).
14. Track action items to completion in a follow-up pass; an untracked postmortem is just a story.

## Default template

Use `references/postmortem-template.md` — it merges the fast engineering-style header/summary/timeline with the formal incident-register fields (roles, categorization, business impact, corrective/preventive actions, severity conclusion) into one document, so nothing needs a second pass later.

## Quality gate

Before finalizing, check that:

- No individual is blamed by name; the analysis targets systems and process.
- The timeline has timestamps and is fact-only; interpretation is in a separate section.
- The root cause is systemic, not "someone made a mistake" or "a bug existed."
- Roles (declarant, incident lead, communication lead, resolution team) are named.
- Category and impacted components are checked based on what actually happened, not left blank.
- Confidentiality/integrity/availability/traceability/destruction impact is assessed explicitly, including "Non" answers.
- Engineering severity (SEV1-4) and the Majeur/Mineur conclusion are both set and consistent with each other.
- Corrective actions (already taken) and preventive actions (future) are listed separately, each with an owner and a due date.
- No secrets, tokens, or customer PII appear in the writeup.
