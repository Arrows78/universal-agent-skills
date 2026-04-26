# Conventional commit examples

## Good examples

```text
feat(invites): add bulk member invitation flow #DEV-123
```

```text
fix(checkout): prevent duplicate subscription creation

Debounce the payment confirmation handler and ignore repeated callbacks for the same payment intent.
```

```text
test(exports): cover csv escaping for quoted values
```

```text
ci(release): publish packages after version tag
```

```text
refactor(pricing): extract plan eligibility rules

Move plan checks into a dedicated policy object before adding annual billing rules.
```

## Weak examples and corrections

Weak:

```text
chore: changes
```

Better:

```text
fix(settings): persist notification preference updates
```

Weak:

```text
feat: updated onboarding
```

Better:

```text
feat(onboarding): show workspace setup checklist
```

Weak:

```text
refactor: fix login bug
```

Better:

```text
fix(auth): handle missing refresh token during login
```
