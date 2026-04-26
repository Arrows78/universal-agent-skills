---
name: tracking-plan
description: Audit, create, update, and govern the Nalo tracking plan — PostHog events, properties, categories, and actions documented in Notion. Use when the user asks to add tracking, review analytics instrumentation, define a new event, update the tracking plan, validate property names, align PRD analytics, or prepare implementation notes.
---

# Tracking Plan

## Purpose

Maintain trustworthy PostHog instrumentation across product discovery, specifications, implementation, QA, and release. The source of truth is the Nalo Tracking Plan in Notion: https://www.notion.so/Tracking-Plan-Nalo-21f4ba287df2807c898ec302ce00443e

## Notion structure

The tracking plan is split into four linked databases:

| Database | URL | Role |
| --- | --- | --- |
| Events | https://www.notion.so/21f4ba287df281cd90e2d618e6deee6e | One row per tracked event |
| Event Properties | https://www.notion.so/21f4ba287df2817b9c2ef525ddf47c7a | Global and specific properties |
| Categories | https://www.notion.so/21f4ba287df280a59acde74289c354b1 | Product area taxonomy |
| Actions | https://www.notion.so/21f4ba287df280d2a6ead2da2cf60c5c | Controlled action verb list |

### Events schema

| Field | Type | Notes |
| --- | --- | --- |
| Event Name | title | Human-readable label |
| Technical Event Name | formula | Auto-built from Category + Object + Action |
| Tracker Name | formula | Auto-built |
| Category | relation → Categories | Product area |
| Object | text | Noun: component or screen |
| Action | relation → Actions | Verb from controlled list |
| Definition | text | What the event means |
| Trigger | text | Exact firing condition |
| Tracking source | select | `Client-Side` or `Server-Side` |
| Global Event Properties | relation → Event Properties | Properties shared across all events |
| Specific Event Properties | relation → Event Properties | Properties unique to this event |
| Properties details | text | Extra property context |
| 🚥 Status | relation → Status | Lifecycle state |

### Event Properties schema

| Field | Type | Notes |
| --- | --- | --- |
| Property Name | title | snake_case name |
| Definition | text | What the property captures |
| Data Type | select | `String`, `Numeric`, `Boolean`, `Date`, `List`, `Array` |
| Example Values | text | Concrete samples |
| Type | select | `Global` (all events) or `Specific` (one event) |
| Status | relation → Status | Lifecycle state |

## Governance principles

- Track product decisions, not curiosity alone.
- Prefer stable business events over fragile UI events. Never encode UI element types (button, modal, dropdown) in event or object names — if the UX changes, the tracking must still hold.
- Use explicit custom events for critical journeys; autocapture only for exploratory analysis.
- Keep event and property names consistent, searchable, and predictable.
- Define the trigger precisely — one event, one moment.
- Avoid personal data, secrets, tokens, raw emails, and unnecessary free text.
- Keep the Notion tracking plan synchronized with PRDs, specs, code, dashboards, and release notes.

## Workflow

1. Understand the product question or decision the tracking must support.
2. Review context: PRD, functional spec, flow, existing Notion events, dashboards, or code snippets.
3. Identify events (Category + Object + Action), properties (Global vs Specific), and tracking source (Client-Side vs Server-Side).
4. Apply the naming convention from `references/naming-conventions.md`.
5. Produce or update the tracking plan using `references/tracking-plan-template.md`.
6. Provide implementation notes or code snippets when requested.
7. Add QA validation steps and lifecycle ownership.
8. Flag stale, duplicate, ambiguous, risky, or missing tracking.

When existing events are provided, preserve backward compatibility unless a rename is worth the migration cost. When renaming, provide a migration plan and dashboard impact notes.

## Event naming convention

The technical event name follows **`category:object_action`**:

- **category** — product area context (e.g., `account_settings`, `signup_flow`, `souscription`).
- **object** — noun: the **business entity or screen**, never the UI element type (button, modal, dropdown…).
- **action** — verb: what happened (e.g., `submit`, `view`, `request`, `start`).

The object must survive UX changes. If a modal becomes a drawer or a button becomes a link, the event name must still be valid.

```text
signup_flow:pricing_page_view
souscription:profile_submit
simulation:results_view
account_settings:password_reset_request
```

Avoid:

```text
account_settings:forgot_password_button_click   ← encodes UI element
onboarding:welcome_modal_close                  ← encodes UI element
button_clicked
click_submit
User Signed Up
signupFlow:buttonClick
```

## Implementation snippet style

When the user asks for implementation examples, keep snippets short and adapt to the stack:

```ts
posthog.capture('souscription:profile_form_submit', {
  simulation_id,
  profile_type: 'couple',
  source_page: 'souscription_flow',
})
```

Only include identifiers that are already available or clearly required. Avoid raw emails, names, messages, or sensitive payloads.

## Output modes

- **New feature**: tracking plan table (Category, Object, Action, Technical Event Name, Trigger, Tracking source, Properties) + implementation notes.
- **PRD or spec review**: missing events, unnecessary events, naming fixes, updated analytics section.
- **Code review**: firing conditions, required properties, duplicates, privacy issues.
- **Notion update**: formatted rows ready to paste into Events and Event Properties databases.
- **Audit**: keep, update, deprecate, and add recommendations with owner and status.

## Quality gate

Before finalizing, verify:

- Every event has a product question.
- Every event has an exact trigger.
- Category, Object, and Action are each defined.
- Technical Event Name follows `category:object_action`.
- Required properties are typed with examples.
- Properties are classified as Global or Specific.
- Tracking source (Client-Side or Server-Side) is specified.
- Privacy risks are called out.
- QA steps are actionable.
- Ownership and status are explicit.
