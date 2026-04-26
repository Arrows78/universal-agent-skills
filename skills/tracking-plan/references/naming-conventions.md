# Tracking plan naming conventions

## Event names

Technical event names follow the **`category:object_action`** pattern, all in snake_case.

- **category** — the product area or flow where the event takes place.
- **object** — a noun describing the **business entity or screen**, not the UI element type.
- **action** — a verb describing what happened.

The **object must not encode UI implementation** (button, modal, dropdown, toggle, card…). If the UX changes tomorrow — a modal becomes a drawer, a button becomes a link — the event name must still make sense. Name what the user did, not how they did it.

Good:

```text
signup_flow:pricing_page_view
souscription:profile_submit
simulation:results_view
dashboard:portfolio_view
onboarding:welcome_dismiss
account_settings:password_reset_request
```

Avoid:

```text
account_settings:forgot_password_button_click   ← encodes UI element
onboarding:welcome_modal_close                  ← encodes UI element
dashboard:portfolio_chart_click                 ← encodes UI element
button_clicked
submit_button_click
User Signed Up
signupCompleted
onboarding_step_complete
```

Use a single category prefix per event. Choose the category that best represents the product context, not the UI component hierarchy.

## Category values

Categories map to product areas managed in the Categories Notion database: https://www.notion.so/21f4ba287df280a59acde74289c354b1

Always pick from the existing list before creating a new category.

## Action verbs

Actions are drawn from the Actions Notion database: https://www.notion.so/21f4ba287df280d2a6ead2da2cf60c5c

Prefer precise verbs:

- `click`
- `view`
- `submit`
- `create`
- `update`
- `delete`
- `open`
- `close`
- `start`
- `complete`
- `fail`
- `select`
- `filter`
- `export`

Always pick from the controlled list before adding a new action.

## Property names

Use **`object_adjective`** in snake_case.

Good:

```text
user_id
item_price
member_count
simulation_id
profile_type
source_page
entry_point
failure_reason
```

Booleans — prefix with `is_` or `has_`:

```text
is_subscribed
has_seen_upsell
is_admin
```

Dates and timestamps — suffix with `_date` or `_timestamp`:

```text
user_creation_date
last_login_timestamp
subscription_start_date
```

Avoid:

```text
workspaceId
Plan Tier
user_email
full_name
raw_error_message
```

## Property types

| Type | Notion Data Type | Example | Notes |
| --- | --- | --- | --- |
| string | String | `profile_type: "couple"` | Use controlled values when possible. |
| number | Numeric | `member_count: 2` | Do not send numbers as strings. |
| boolean | Boolean | `is_subscribed: true` | Prefix with `is_`, `has_`, or `can_`. |
| enum | String | `source_page: "souscription_flow"` | Document allowed values. |
| date | Date | `subscription_start_date: "2026-04-26"` | ISO 8601 date. |
| timestamp | Date | `last_login_timestamp: "2026-04-26T10:30:00Z"` | ISO 8601 datetime. |
| list / array | List / Array | `selected_funds: ["fund_a", "fund_b"]` | Use only when necessary. |

## Global vs Specific properties

- **Global** — present on every event (e.g., `user_id`, `session_id`). Managed in Event Properties with `Type: Global`.
- **Specific** — relevant only to one event (e.g., `simulation_id` on a simulation event). Managed with `Type: Specific`.

## Privacy rules

Never track:

- Raw email addresses unless explicitly approved.
- Passwords, tokens, API keys, secrets, or private messages.
- Payment card data or sensitive billing details.
- Health, legal, or special-category personal data without an approved compliance process.
- Large free-text fields that may contain sensitive information.
