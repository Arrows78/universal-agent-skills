# PRD one-pager example

```markdown
# One-pager: Weekly digest email

**Problem** — New users unsubscribe from daily notification emails at 3x the rate of active weekly-digest users; 40% of unsubscribes happen in the first 7 days.

**Goal** — Reduce first-30-day email unsubscribe rate for new workspaces by 50%.

**Non-goals** — Not redesigning notification content or in-app notification center; email cadence only.

**Solution** — Default new workspaces to a weekly digest instead of daily; users can switch to daily anytime in notification settings. Existing daily-default workspaces are unaffected.

**Key requirements**

- New workspaces default to weekly digest.
- Settings page exposes a daily/weekly toggle, defaulting to the workspace's current setting.
- Digest email groups notifications by type instead of chronologically.

**Risks / open questions**

- Will weekly digests reduce feature-adoption speed for time-sensitive notifications? — needs a guardrail metric.
- Existing daily-default workspaces created before this change: migrate or leave as-is? — decision needed from Growth.

**Next step** — Decision needed from Growth on migration by [date]; engineering kickoff the week after.
```
