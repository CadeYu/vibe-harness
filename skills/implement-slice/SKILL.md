---
name: implement-slice
description: Use when implementing one thin vertical slice after project framing is available.
---

# 实现 Slice

实现一条 focused vertical slice，并补齐 tests、verification 和 status update。

## 触发时机

以下情况使用这个 skill：

- `docs/plans/active.md` defines the current slice
- the user asks to implement a framed feature
- the next step is coding rather than planning

## 必读材料

- `AGENTS.md`
- `docs/product.md`
- `docs/architecture.md`
- `docs/plans/active.md`
- relevant source files
- relevant tests

## 流程

1. 简要复述 slice 和 acceptance criteria。
2. 编辑前先检查 existing code patterns。
3. 在实际可行时，先添加或更新 behavior tests。
4. 用最小改动满足 slice。
5. 运行 `./scripts/check.sh`。
6. 当改动触及 build、integration、persistence 或 public behavior 时，运行 `./scripts/verify.sh`。
7. 更新 `docs/status.md`：changes、commands run、results、risks、next step。
8. 如果出现重复 failure，进入 mistake ratchet。

## 产出

- Focused code change。
- Tests or explicit test gap。
- Verification evidence。
- Updated status。
- Suggested commit message。

## 边界

- 没有新 plan，不要扩展任务。
- 没有证据，不要声称 commands were run。
- 不要静默忽略 failed checks。
