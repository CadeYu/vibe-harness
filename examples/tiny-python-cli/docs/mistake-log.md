# Mistake Log

## Example Entry

### Date

2026-05-25

### What Happened

An agent could forget to handle closing a missing issue.

### Guardrail

`tests/test_core.py` includes `test_closing_missing_issue_fails`.

### Follow-Up Verification

Run `./scripts/check.sh`.

