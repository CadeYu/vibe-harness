# Session Handoff

在结束 session、切换 agent 或上下文可能压缩前使用。

```text
Prepare a handoff for the next agent session.

Read:
- AGENTS.md
- docs/product.md
- docs/architecture.md
- docs/plans/active.md
- docs/status.md
- docs/mistake-log.md
- current git diff or changed files

Update docs/status.md with:
- what is complete
- what is incomplete
- commands run
- known failures
- decisions made
- next recommended action

Output:
- Current state
- Changed files
- Verification evidence
- Risks
- Exact next step

Constraints:
- Do not bury failed checks.
- Do not rely on chat-only context.
- Do not invent a clean state if the worktree is dirty.
```
