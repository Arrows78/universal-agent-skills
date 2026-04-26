# Mermaid patterns for functional specs

## User flow

```mermaid
flowchart TD
  A[User opens settings] --> B[Clicks Invite teammates]
  B --> C[Enters email addresses]
  C --> D{All emails valid?}
  D -->|Yes| E[Create invitations]
  D -->|No| F[Show inline validation]
  E --> G[Show confirmation]
```

## Sequence diagram

```mermaid
sequenceDiagram
  actor User
  participant Web as Web app
  participant API as Backend API
  participant Mail as Email service
  User->>Web: Submit invitations
  Web->>API: POST /invitations
  API->>Mail: Send invitation emails
  API-->>Web: Return created invitations
  Web-->>User: Show confirmation
```

## State diagram

```mermaid
stateDiagram-v2
  [*] --> Draft
  Draft --> PendingReview: Submit
  PendingReview --> Approved: Approve
  PendingReview --> Rejected: Reject
  Approved --> Published: Publish
  Rejected --> Draft: Edit
```

## Entity relationship

```mermaid
erDiagram
  WORKSPACE ||--o{ INVITATION : creates
  USER ||--o{ INVITATION : sends
  INVITATION }o--|| ROLE : grants
```

## Diagram rules

- Keep labels short and business-readable.
- Avoid more than 12 nodes unless the user asks for a detailed process map.
- Add one sentence before the diagram explaining the key takeaway.
