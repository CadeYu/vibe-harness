# Benchmark

Benchmark 用来判断 harness 是否真的改变了 vibe coding 的结果。

不要只问“这套流程看起来是否专业”。要用固定任务集比较：

- 完成率是否提高。
- 重试次数是否下降。
- Review 前缺陷数是否减少。
- 新会话恢复时间是否缩短。

## 基准任务

一个好的基准任务应该：

- 代表真实项目风险。
- 能在合理时间内完成。
- 有明确通过标准。
- 可以在不同 harness 版本下重复执行。

示例：

| ID | 任务 | 覆盖风险 | 通过标准 |
| --- | --- | --- | --- |
| bench-001 | 创建并读取一条记录 | 端到端路径 | check 通过且记录可读回 |
| bench-002 | 修改 API response | 契约兼容 | contract check 通过 |
| bench-003 | 执行一次迁移 | 数据风险 | migration validate 通过 |

## 对比方式

至少记录三种快照：

- baseline：弱 harness。
- improved：加入 feature list、sensor 和 handoff 后。
- simplified：移除某个 harness 组件后的实验。

## 结果解释

- 如果 improved 明显更好，保留新增组件。
- 如果 simplified 不退化，说明被移除组件可能已经过期。
- 如果结果不稳定，先看任务定义和 sensor 是否一致，不要急着归因模型。

Benchmark 的目标不是刷分，而是帮助你判断哪些 harness 组件是承重结构。
