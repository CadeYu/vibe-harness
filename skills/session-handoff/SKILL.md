---
name: session-handoff
description: Use before ending a session, switching agents, compacting context, or pausing work.
---

# Session Handoff

把有用项目状态保存在 chat context 之外。

## 触发时机

以下情况使用这个 skill：

- a work session is ending
- context may compact or reset
- another agent or human will continue
- the worktree has meaningful incomplete work

## 必读材料

- `AGENTS.md`
- `docs/product.md`
- `docs/architecture.md`
- `docs/plans/active.md`
- `docs/status.md`
- `docs/mistake-log.md`
- current changed files or git diff
- command outputs from the session

## 流程

1. 识别 completed work。
2. 识别 incomplete work。
3. 记录 commands run and results。
4. 记录 known failures and risks。
5. 记录本 session 做过的 decisions。
6. 更新 `docs/status.md`。
7. 给出 exact next recommended action。

## 产出

- Updated status。
- Changed files summary。
- Verification evidence。
- Known risks。
- Next action。

## 边界

- 如果 worktree dirty，不要声称 clean state。
- 不要隐藏 failed checks。
- 不要让未来工作依赖 private chat context。
