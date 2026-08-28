# Release notes examples

## Weak vs improved

Weak:

```markdown
- Fixed DEV-482
- Refactored export service
- Added PDF export (backend)
```

Improved:

```markdown
**New: Export reports as PDF**
You can now export any report as a PDF directly from the report toolbar — no more screenshotting.

**Fixed**
- Reports with more than 50 rows no longer fail to export.
```

## Breaking change example

```markdown
### Changed
- `GET /v1/invoices` now returns amounts in cents instead of a formatted string. **Action required**: update integrations expecting a formatted amount before [date]. See the [migration guide](#).
```
