---
name: prd-writer
description: Write, review, and improve product requirements documents for product managers and cross-functional teams. Use when the user asks for a prd, product brief, product requirements, opportunity framing, product scope, success metrics, user stories, launch requirements, product decision documentation, or a stakeholder-ready product plan.
---

# PRD Writer

## Purpose

Create pragmatic Product Requirements Documents that help teams decide what to build, why it matters, how success will be measured, and what is explicitly out of scope.

## PRD principles

- Lead with the customer problem, not the solution.
- Distinguish evidence from assumptions.
- Connect requirements to outcomes and success metrics.
- Make tradeoffs visible.
- Keep the PRD concise enough to be read and specific enough to execute.
- Expose open questions and risks.
- Write for Product, Design, Engineering, Data, Support, Sales, and Leadership.

## Creation workflow

1. Extract context from notes, research, customer feedback, strategy, analytics, constraints, and stakeholder requests.
2. Define the problem, target users, current pain, and business opportunity.
3. Clarify goals, non-goals, success metrics, and guardrail metrics.
4. Describe the proposed product experience at the right level of fidelity.
5. Convert scope into requirements, user stories, and acceptance criteria.
6. Identify dependencies, rollout strategy, analytics, risks, and decisions needed.
7. Mark assumptions, confidence level, and open questions.
8. End with crisp next steps.

If information is incomplete, draft the PRD anyway and label assumptions clearly.

## Default structure

```markdown
# PRD: [Product / Feature]

## 1. Executive Summary
## 2. Context and Problem
## 3. Target Users and Personas
## 4. Goals, Non-goals, and Success Metrics
## 5. Proposed Solution
## 6. User Stories and Use Cases
## 7. Requirements
## 8. UX, Content, and Edge Cases
## 9. Analytics and Experimentation
## 10. Dependencies and Constraints
## 11. Rollout and Launch Plan
## 12. Risks and Mitigations
## 13. Open Questions
## 14. Decision Log
## 15. Appendix
```

Use `references/prd-template.md` for the full template and `references/review-checklist.md` when reviewing an existing PRD.

## Requirement style

Separate product requirements from implementation tasks.

```markdown
| ID | Requirement | Priority | Rationale | Acceptance criteria |
| --- | --- | --- | --- | --- |
| PRD-001 | Users can filter projects by owner and status. | Must | Reduces time spent finding active work. | Given projects exist, when a user applies filters, then the list updates and selected filters remain visible. |
```

Use priority labels consistently: `Must`, `Should`, `Could`, `Won't`.

## Quality gate

Before finalizing, check that:

- The problem is specific and evidenced.
- Goals and non-goals are explicit.
- Metrics are measurable and decision-useful.
- Requirements are testable.
- Risks and dependencies are visible.
- Open questions have owners when possible.
