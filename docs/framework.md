# 框架

Vibe Harness 有一组轻量分层机制。

## 上下文层

相关文件：

- `AGENTS.md`
- `docs/product.md`
- `docs/architecture.md`
- `docs/status.md`
- `docs/plans/active.md`
- `docs/decisions/`

作用：

- 显式记录产品意图
- 暴露架构边界
- 把 session 状态保存在 repo，而不是聊天窗口

## 工作流层

相关文件：

- `prompts/start-project.md`
- `prompts/implement-slice.md`
- `prompts/review-diff.md`
- `prompts/update-status.md`
- `prompts/session-handoff.md`

作用：

- 让 agent 的工作保持 scoped
- 让每一步开发动作可重复
- 减少模糊指令

## Sensor 层

相关文件：

- `scripts/audit.sh`
- `scripts/install.sh`
- `scripts/check-consistency.sh`
- `scripts/check.sh`
- `scripts/verify.sh`
- project tests
- manual QA checklists
- contract checks
- migration checks
- smoke tests

作用：

- 把 completion 变成 evidence
- 尽早暴露失败
- 给 agent 和人类一个稳定命令入口
- 降低安装和审计摩擦

更完整的 sensor 分类见 `docs/sensors.md`。后端项目尤其要关注 contract、data、permission 和 runtime invariant。

## Agent 层

相关文件：

- `docs/agents.md`
- `docs/orchestration.md`
- `prompts/dispatch-review.md`
- `prompts/design-sensors.md`

作用：

- 定义 main agent 和 specialist agents 的边界。
- 明确什么时候从单 agent 升级到 multi-agent。
- 把 reviewer、test、architect、sensor agent 的输出约束为 findings、missing tests、boundary risks 和 sensor gaps。
- 防止 multi-agent 变成无约束并行写代码。

## 模板尺寸

Vibe Harness 提供三种 additive size：

| Size | 用途 | 说明 |
| --- | --- | --- |
| S | 最小项目/面试现场 | 所有核心机制都有，但文件极少。 |
| M | 默认推荐 | 加入 architecture、plans、mistake log、ADR 和 full verification。 |
| L | 团队/长期项目 | 加入 multi-agent roles、orchestration、sensor matrix、PR rails、CI signal 和 ratchet cases。 |

安装：

```sh
./scripts/install.sh /path/to/project --size M
```

审计：

```sh
./scripts/audit.sh /path/to/project
```

## Ratchet 层

相关文件：

- `docs/mistake-log.md`
- tests
- scripts
- lint rules
- ADRs
- prompts
- skills

作用：

- 让重复错误更难重复发生
- 把失败转成版本化项目知识
- 持续提高项目对错误的敏感度

## Skill 层

相关文件：

- `skills/frame-project/SKILL.md`
- `skills/implement-slice/SKILL.md`
- `skills/review-diff/SKILL.md`
- `skills/solidify-mistake/SKILL.md`
- `skills/session-handoff/SKILL.md`

作用：

- 提供可复用 agent operating procedures
- 让不同项目里的 agent 行为更一致
- 把主循环变成可以调用的能力

## 一致性层

相关文件：

- `scripts/check-consistency.sh`
- `tests/test_consistency.sh`
- `.github/workflows/validate.yml`

作用：

- 防止 README 列出的 prompts 和实际文件不一致。
- 防止 `docs/skills.md` 漏列新增 skill。
- 防止 `docs/examples.md` 漏列新增 example。
- 确保核心 framework docs 始终存在。

这层来自 harness engineering 的一个重要判断：文档不是写完就结束，文档之间也需要 sensor。
