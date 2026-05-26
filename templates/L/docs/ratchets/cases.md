# Ratchet Cases

## Case 1: Missing Edge Case

Failure:

```text
Agent implemented the happy path but missed empty input.
```

Guardrail:

```text
Add a regression test for empty input.
```

## Case 2: Architecture Boundary Violation

Failure:

```text
Agent placed display formatting in persistence code.
```

Guardrail:

```text
Update docs/architecture.md and add review checklist coverage.
```

## Case 3: Verification Skipped

Failure:

```text
Agent claimed completion without command evidence.
```

Guardrail:

```text
Make scripts/check.sh the required completion gate.
```

