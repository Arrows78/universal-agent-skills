# Platform integration notes

## Commit subjects and PR titles

Use Conventional Commit style for PR titles when the merge commit inherits the title.

Good:

```text
feat(settings): add notification preferences
fix(auth): preserve redirect after expired session
```

Avoid:

```text
WIP settings update
Fix stuff
Made with Cursor
```

## Issue references

Use the reference style that matches the platform or team. Issue reference should be visible in both the subject and the footer.

Common patterns:

```text
Closes #DEV-123
Refs #DEV-123
Fixes #DEV-123
Resolves #DEV-123
```

## Breaking changes

Platform readers should see both the header marker and the footer:

```text
feat(api)!: require workspace id for exports

BREAKING CHANGE: export requests must include workspace_id.
```

## Sensitive data

Do not include tokens, API keys, customer secrets, raw personal data, or private incident details in commit messages.
