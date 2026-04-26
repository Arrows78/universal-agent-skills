# Tracking audit checklist

## Coverage

- Critical activation, conversion, retention, monetization, and failure moments are tracked.
- Events map to product questions or decisions.
- Important flows have start, success, and failure events when needed.

## Naming

- Technical event names follow `category:object_action` in snake_case.
- Category exists in the Categories Notion database.
- Action exists in the Actions Notion database.
- The object names a business entity or screen — not a UI element (no `button`, `modal`, `dropdown`, `card`, `toggle`).
- Property names follow the `object_adjective` pattern in snake_case.
- Booleans are prefixed with `is_` or `has_`.
- Date/timestamp properties end with `_date` or `_timestamp`.
- Event names describe business outcomes, not UI interactions.

## Trigger quality

- Each event has a precise firing condition.
- Events fire once per intended action.
- Server-Side tracking is used for critical irreversible actions when reliability matters.
- Autocapture is not the only source for high-value business events.

## Properties

- Properties are classified as Global or Specific.
- Required properties are present and typed.
- Data types match the Notion Event Properties schema (String, Numeric, Boolean, Date, List, Array).
- Enum values are documented with allowed values.
- Context is captured as properties rather than duplicating event names.

## Tracking source

- Tracking source is specified: Client-Side or Server-Side.
- Server-Side is preferred for transactional or irreversible actions.

## Privacy and compliance

- No secrets, tokens, raw emails, raw names, private text, or sensitive payloads are sent.
- Identifiers are necessary and approved.
- Retention and access implications are understood.

## Lifecycle

- Owner and 🚥 Status are defined in Notion.
- Deprecated events have replacements or migration notes.
- Dashboards, funnels, alerts, and experiments are checked after changes.
- QA validation steps are documented and actionable.
