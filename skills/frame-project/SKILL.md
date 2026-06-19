---
name: frame-project
description: 开始新项目，或在实现前把 Vibe Harness 加到已有仓库时使用。
---

# Frame Project（项目定框）

在写产品代码之前，把原始想法转成项目本地 context。

## 触发时机

以下情况使用这个 skill：

- 开始一个新项目。
- 把 Vibe Harness 加到已有项目。
- 功能想法较宽泛，范围还不清楚。
- 准备现场 vibe coding session。

## 必读材料

- 如果存在，阅读 `AGENTS.md`。
- 如果存在，阅读 `docs/product.md`。
- 如果存在，阅读 `docs/architecture.md`。
- 如果存在，阅读 `docs/plans/active.md`。
- 如果存在，阅读 `feature_list.json`。
- 阅读顶层项目文件，例如 `README.md`、依赖清单或构建文件。

## 流程

1. 识别产品目标、用户、非目标和成功标准。
2. 识别硬约束和风险假设。
3. 定义最小可端到端验证的 vertical slice。
4. 更新 `docs/product.md`。
5. 更新 `docs/architecture.md`。
6. 更新 `docs/plans/active.md`。
7. 更新 `feature_list.json`，写入第一条 feature 的 verification。
8. 推荐初始化命令、快速验证命令、功能状态校验命令、完整验证命令和收尾检查命令。

## 产出

- 更新后的产品上下文。
- 更新后的架构上下文。
- 更新后的 active plan。
- 更新后的 feature list。
- 验证计划。
- 初始化和干净收尾计划。
- 只保留会实质影响正确性的阻塞问题。

## 边界

- 不要在这个 skill 中实现产品代码。
- 不要把范围扩大到第一条 useful slice 之外。
- 小项目不要设计重架构。
