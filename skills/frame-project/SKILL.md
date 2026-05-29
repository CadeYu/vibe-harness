---
name: frame-project
description: Use when starting a new project or adding Vibe Harness to an existing repository before implementation.
---

# Frame Project

在写 product code 之前，把原始想法转成项目本地 context。

## 触发时机

以下情况使用这个 skill：

- starting a new project
- adding Vibe Harness to an existing project
- broad feature idea with unclear scope
- preparing a live vibe coding session

## 必读材料

- `AGENTS.md` if present
- `docs/product.md` if present
- `docs/architecture.md` if present
- `docs/plans/active.md` if present
- top-level project files such as `README.md`, package manifests, or build files

## 流程

1. 识别 product goal、users、non-goals 和 success criteria。
2. 识别 hard constraints 和 risky assumptions。
3. 定义最小可 end-to-end verify 的 vertical slice。
4. 更新 `docs/product.md`。
5. 更新 `docs/architecture.md`。
6. 更新 `docs/plans/active.md`。
7. 推荐 fast verification command 和 full verification command。

## 产出

- 更新后的 product context。
- 更新后的 architecture context。
- 更新后的 active plan。
- Verification plan。
- 只保留会实质影响正确性的 blocking questions。

## 边界

- 不要在这个 skill 中实现 product code。
- 不要把 scope 扩大到第一条 useful slice 之外。
- 小项目不要设计重架构。
