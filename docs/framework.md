# Framework

Vibe Harness 有五层。

## Context Layer

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

## Workflow Layer

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

## Verification Layer

相关文件：

- `scripts/audit.sh`
- `scripts/install.sh`
- `scripts/check.sh`
- `scripts/verify.sh`
- project tests
- manual QA checklists

作用：

- 把 completion 变成 evidence
- 尽早暴露失败
- 给 agent 和人类一个稳定命令入口
- 降低安装和审计摩擦

## Template Sizes

Vibe Harness 提供三种 additive size：

| Size | 用途 | 说明 |
| --- | --- | --- |
| S | 最小项目/面试现场 | 所有核心机制都有，但文件极少。 |
| M | 默认推荐 | 加入 architecture、plans、mistake log、ADR 和 full verification。 |
| L | 团队/长期项目 | 加入 PR rails、CI signal、ratchet cases 和 audit wrapper。 |

安装：

```sh
./scripts/install.sh /path/to/project --size M
```

审计：

```sh
./scripts/audit.sh /path/to/project
```

## Ratchet Layer

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

## Skills Layer

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
