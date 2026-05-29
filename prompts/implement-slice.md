# 实现 Slice

实现一条已经 frame 好的 vertical slice 时使用。

```text
Implement the current vertical slice from docs/plans/active.md.

Before editing:
1. Read AGENTS.md.
2. Read docs/product.md.
3. Read docs/architecture.md.
4. Read docs/plans/active.md.
5. Inspect the relevant existing code.

Implementation constraints:
- Keep the change focused on the active slice.
- Follow existing project patterns.
- Keep domain logic out of interface and persistence code unless docs/architecture.md says otherwise.
- Add or update tests for non-trivial behavior.
- Update docs/status.md after implementation.

Verification:
- Run ./scripts/check.sh before claiming completion.
- If ./scripts/check.sh fails, summarize the failure, root cause, and next fix.
- Run ./scripts/verify.sh when the change touches build, integration, persistence, or public behavior.

Output:
- Files changed
- Behavior implemented
- Tests added or updated
- Commands run and results
- Known risks or follow-up work
```
