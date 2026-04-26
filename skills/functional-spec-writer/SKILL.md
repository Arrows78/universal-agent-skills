---
name: functional-spec-writer
description: Write, review, and improve functional specification documentation in markdown for product, design, engineering, qa, support, and stakeholder audiences. Use when the user asks for a functional spec, feature specification, user flow documentation, acceptance criteria, implementation-ready behavior descriptions, states, edge cases, or mermaid diagrams.
---

# Functional Spec Writer

## Purpose

Create functional specifications that are readable by non-technical stakeholders and useful for engineers. Use Markdown, explicit assumptions, concrete examples, and Mermaid diagrams when they clarify behavior.

## Writing principles

- Start with the user problem and expected outcome before implementation details.
- Separate what the product must do from how engineering might implement it.
- Make permissions, empty states, error states, edge cases, and analytics explicit.
- Use tables when they improve scanning.
- Use Mermaid only when it reduces ambiguity.
- Keep diagrams simple enough to maintain in Markdown.

## Creation workflow

1. Build context from notes, PRDs, tickets, designs, existing docs, code, or conversation.
2. State assumptions and open questions early.
3. Define scope, non-goals, personas, and affected surfaces.
4. Describe the happy path first, then alternate paths and edge cases.
5. Add functional requirements with acceptance criteria.
6. Add diagrams for flows, states, sequence interactions, or entities when useful.
7. Add tracking, permissions, rollout, QA, and dependencies.
8. Finish with a validation checklist.

If important information is missing, draft the spec anyway and label assumptions and open questions.

## Default structure

```markdown
# Functional Specification: [Feature]

## 1. Summary
## 2. Goals and Non-goals
## 3. Users and Use Cases
## 4. Scope
## 5. User Journey
## 6. Functional Requirements
## 7. States and Edge Cases
## 8. Permissions and Access Rules
## 9. Data and Content Requirements
## 10. Analytics and Tracking
## 11. Dependencies
## 12. Rollout and Migration
## 13. QA Scenarios
## 14. Open Questions
## 15. Appendix
```

Use `references/functional-spec-template.md` for the full template and `references/mermaid-patterns.md` for diagrams.

## Requirement style

Write requirements as testable statements.

```markdown
| ID | Requirement | Priority | Acceptance criteria |
| --- | --- | --- | --- |
| FR-001 | Users can invite multiple teammates by email from workspace settings. | Must | Given valid emails, when the user submits the form, then invitations are created and confirmation is shown. |
```

Use priority labels consistently: `Must`, `Should`, `Could`, `Won't`.

## Quality gate

Before finalizing, check that:

- A non-technical reader can understand the purpose.
- An engineer can identify expected behavior and boundaries.
- QA can derive test scenarios from the requirements.
- Diagrams are valid Mermaid and not decorative.
- Open questions are explicit.
- The spec avoids solution lock-in unless requested.
