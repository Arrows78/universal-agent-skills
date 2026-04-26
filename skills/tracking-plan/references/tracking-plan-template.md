# Tracking plan template

Use this template to document events for a new feature or product area before adding them to Notion.

```markdown
# Tracking Plan: [Feature / Area]

Owner: [Name / Team]
Status: Draft / In review / Implemented / Validated / Deprecated
Last updated: [Date]
Related docs: [PRD, spec, ticket, dashboard]
Notion tracking plan: https://www.notion.so/Tracking-Plan-Nalo-21f4ba287df2807c898ec302ce00443e

## 1. Product Questions

| ID | Question | Decision supported | Priority |
| --- | --- | --- | --- |
| Q1 | [What do we need to learn?] | [Decision] | High/Medium/Low |

## 2. Event Plan

| Category | Object | Action | Technical Event Name | Trigger | Tracking source | Owner | Status |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `souscription` | `profile_form` | `submit` | `souscription:profile_form_submit` | [Exact firing condition] | Client-Side | [Owner] | Proposed |

## 3. Event Details

### `category:object_action`

Definition: [What this event means and why it exists]
Trigger: [Exact moment it fires]
Actor: [User / system / admin]
Tracking source: Client-Side / Server-Side
Status: Proposed / Implemented / Validated / Deprecated
Owner: [Owner]
Product question: Q1

**Global Properties** (inherited by all events):

| Property Name | Data Type | Example Values | Definition |
| --- | --- | --- | --- |
| `user_id` | String | `usr_123` | Unique user identifier. |

**Specific Properties** (this event only):

| Property Name | Data Type | Required | Example Values | Definition |
| --- | --- | --- | --- | --- |
| `simulation_id` | String | Yes | `sim_456` | Associated simulation identifier. |
| `profile_type` | String | Yes | `individual`, `couple` | Type of investor profile. |
| `source_page` | String | No | `souscription_flow` | Page where the event was triggered. |

QA:
- [ ] Event fires exactly once per intended action.
- [ ] Required properties are present and non-null.
- [ ] Verify in PostHog Live Events after deploy.

Notes:
- [Migration, dashboard impact, privacy notes]

## 4. Deprecated or Replaced Events

| Old event | Replacement | Migration plan | Consumers to update |
| --- | --- | --- | --- |
| `old_event` | `new_event` | [Plan] | [Dashboards / funnels] |

## 5. Dashboard and Funnel Impact

| Asset | Owner | Change needed | Due date |
| --- | --- | --- | --- |
| [Dashboard / funnel] | [Owner] | [Update] | [Date] |

## 6. Open Questions

| Question | Owner | Needed by | Impact |
| --- | --- | --- | --- |
| [Question] | [Owner] | [Date] | [Impact] |
```
