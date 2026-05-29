---
name: implement-slice
description: 项目已经定框后，用来实现一条 thin vertical slice。
---

# 实现 Slice

实现一条聚焦的 vertical slice，并补齐 tests、验证和状态更新。

## 触发时机

以下情况使用这个 skill：

- `docs/plans/active.md` 已定义当前 slice。
- 用户要求实现一个已经定框的功能。
- 下一步应该写代码，而不是继续规划。

## 必读材料

- `AGENTS.md`
- `docs/product.md`
- `docs/architecture.md`
- `docs/plans/active.md`
- 相关源码文件。
- 相关 tests。

## 流程

1. 简要复述 slice 和验收标准。
2. 编辑前先检查现有代码模式。
3. 在实际可行时，先添加或更新行为 tests。
4. 用最小改动满足 slice。
5. 运行 `./scripts/check.sh`。
6. 当改动触及构建、集成、持久化或公开行为时，运行 `./scripts/verify.sh`。
7. 更新 `docs/status.md`：改动、已运行命令、结果、风险、下一步。
8. 如果出现重复失败，进入 mistake ratchet。

## 产出

- 聚焦当前 slice 的代码改动。
- Tests，或明确说明测试缺口。
- 验证证据。
- 更新后的 status。
- 建议的 commit message。

## 边界

- 没有新 plan，不要扩展任务。
- 没有证据，不要声称命令已经运行。
- 不要静默忽略失败的检查。
