---
name: frame-project
description: Use when starting a new project or adding Vibe Harness to an existing repository before implementation.
---

# Frame Project

在写 product code 之前，把原始想法转成项目本地 context。

## Trigger

以下情况使用这个 skill：

- starting a new project
- adding Vibe Harness to an existing project
- broad feature idea with unclear scope
- preparing a live vibe coding session

## Required Reads

- `AGENTS.md` if present
- `docs/product.md` if present
- `docs/architecture.md` if present
- `docs/plans/active.md` if present
- top-level project files such as `README.md`, package manifests, or build files

## Process

1. 识别 product goal、users、non-goals 和 success criteria。
2. 识别 hard constraints 和 risky assumptions。
3. 定义最小可 end-to-end verify 的 vertical slice。
4. 更新 `docs/product.md`。
5. 更新 `docs/architecture.md`。
6. 更新 `docs/plans/active.md`。
7. 推荐 fast verification command 和 full verification command。

## Outputs

- Updated product context
- Updated architecture context
- Updated active plan
- Verification plan
- Blocking questions only when they materially affect correctness

## Boundaries

- 不要在这个 skill 中实现 product code。
- 不要把 scope 扩大到第一条 useful slice 之外。
- 小项目不要设计重架构。

