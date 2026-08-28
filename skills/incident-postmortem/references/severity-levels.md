# Incident severity levels

- **SEV1 — Critical**: Full outage, data loss, security breach, or payment failure affecting all or most users. Immediate all-hands response.
- **SEV2 — High**: Major feature broken or significant subset of users affected; no data loss. Response within the on-call SLA.
- **SEV3 — Medium**: Degraded experience or minor feature broken for a limited segment; workaround exists.
- **SEV4 — Low**: Cosmetic or edge-case issue with negligible user impact.

Classify by actual impact observed, not by how the incident felt to respond to.

## Mapping to the formal Majeur / Mineur conclusion

The postmortem template's final "Majeur / Mineur" classification is the two-tier call that goes in the incident register. As a default mapping:

- **SEV1, SEV2 → Majeur** — full or major outage, security/data impact, or company-wide disruption (internal or customer-facing).
- **SEV3, SEV4 → Mineur** — degraded or cosmetic impact with a workaround, limited to a small segment.

Override the default when the duration or business context warrants it — for example, a SEV2 that dragged on for many hours company-wide can justify "Majeur" even without data loss.
