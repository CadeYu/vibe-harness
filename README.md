# Vibe Harness

一个 repo-native 的 vibe coding harness framework，用来把 AI 辅助开发从“靠感觉催代码”变成“有上下文、有验证、有复盘、有护栏”的工程循环。

Vibe coding 很快。Harness engineering 让它可重复、可审查、可恢复。

## 它解决什么问题

很多 AI coding 失败不是因为模型不会写代码，而是因为项目信息只存在聊天里：

- 目标不清楚
- 边界不清楚
- 验证命令不稳定
- 错误没有沉淀
- 下一个 session 失去上下文

Vibe Harness 把这些东西放回 repo：

- `docs/` 保存产品、架构、状态和决策
- `prompts/` 提供可粘贴的工作指令
- `skills/` 提供可复用的 agent 操作规程
- `scripts/` 提供稳定验证入口
- `mistake-log` 把失败固化成护栏

## 核心文档

| 文档 | 什么时候读 |
| --- | --- |
| `docs/spec.md` | 想理解这个 framework 到底定义了什么。 |
| `docs/framework.md` | 想理解 context、workflow、agent、sensor、ratchet、skills 等分层结构。 |
| `docs/workflow.md` | 日常开发要按哪条 loop 推进。 |
| `docs/agents.md` | 想设计 multi-agent 角色和触发条件。 |
| `docs/orchestration.md` | 想决定什么时候单 agent，什么时候 specialist review。 |
| `docs/sensors.md` | 要为前端、后端或全栈项目设计检查入口。 |
| `docs/mistake-ratchet.md` | agent 犯错后要把错误固化成 guardrail。 |
| `docs/interview-playbook.md` | 准备现场 vibe coding 面试。 |
| `docs/references.md` | 想知道这个 repo 吸收了哪些外部 harness 思路。 |

## 主循环

```text
Frame -> Slice -> Verify -> Review -> Ratchet -> Handoff
```

| 阶段 | 作用 |
| --- | --- |
| Frame | 定义目标、非目标、架构边界和验证方式。 |
| Slice | 只实现一条可端到端验证的 thin vertical slice。 |
| Verify | 用项目内脚本把“感觉完成”变成证据。 |
| Review | 审查 diff，优先找 bug、漏测、越界和过度设计。 |
| Ratchet | 把重复错误固化成 docs、tests、lint、scripts、prompts、ADR 或 skills。 |
| Handoff | 把状态写回 repo，让下一轮不依赖隐藏聊天上下文。 |

## 快速开始

推荐用 installer：

```sh
./scripts/install.sh /path/to/project --size M
```

先看会写哪些文件：

```sh
./scripts/install.sh /path/to/project --size M --dry-run
```

检查一个项目的 harness 成熟度：

```sh
./scripts/audit.sh /path/to/project
```

也可以手动复制基础 harness：

```sh
cp -R templates/base/. /path/to/project/
cd /path/to/project
chmod +x scripts/check.sh scripts/verify.sh
```

然后从 `prompts/start-project.md` 开始，把项目目标、架构边界和第一条 slice 写进：

```text
docs/product.md
docs/architecture.md
docs/plans/active.md
```

日常开发时按这个顺序走：

1. 用 `prompts/start-project.md` frame 项目。
2. 用 `prompts/implement-slice.md` 实现一条 slice。
3. 运行 `scripts/check.sh`。
4. 用 `prompts/review-diff.md` 做 diff review。
5. 出错时用 `prompts/solidify-mistake.md` 固化错误。
6. 风险升高时用 `prompts/dispatch-review.md` 分发 specialist review。
7. 验证覆盖不足时用 `prompts/design-sensors.md` 设计 sensor matrix。
8. 需要中途更新状态时用 `prompts/update-status.md`。
9. 结束前用 `prompts/session-handoff.md` 更新状态。

## 仓库结构

```text
scripts              framework audit/install/check tools
tests                shell tests for framework scripts
templates/S          minimal harness template
templates/M          default harness template
templates/L          long-running project extension
templates/base       generic starter harness
templates/frontend   frontend docs and review prompt
templates/backend    backend docs and review prompt
templates/fullstack  fullstack user-flow docs
prompts              pasteable prompts for AI coding agents
skills               reusable operating procedures
docs                 framework docs
examples             walkthroughs and runnable examples
```

## 选择 S / M / L

| Size | 适合场景 | 包含内容 |
| --- | --- | --- |
| S | 面试现场、个人小项目、刚起步 repo | `AGENTS.md`、product/status docs、`check.sh` |
| M | 默认推荐，公开项目或长期个人项目 | S + architecture、active plan、mistake log、ADR、`verify.sh` |
| L | 团队项目、多 agent、长期维护 | M + agents、orchestration、sensor matrix、PR template、CI、ratchet cases |

从小开始。需要更强约束时再升级，不要一开始把简单项目压重。

## 为什么它是 Harness

一个真正有用的 harness 不只是 prompt 集合，它至少需要三类东西：

- sensors：例如 `scripts/check.sh` 和 `scripts/verify.sh`
- state：例如 `docs/status.md`、`docs/plans/active.md`、ADR
- ratchets：把失败变成下次更难再犯的护栏

目标不是让 AI “更听话”，而是让项目对错误更敏感。

## 技能集合

第一版内置 5 个 skills：

- `frame-project`
- `implement-slice`
- `review-diff`
- `solidify-mistake`
- `session-handoff`

如果你的 AI coding 环境支持 skills，可以直接复制对应目录。如果不支持，也可以把 `SKILL.md` 当作操作清单使用。

## Prompt 集合

第一版内置 8 个 prompts：

- `prompts/dispatch-review.md`
- `prompts/design-sensors.md`
- `prompts/start-project.md`
- `prompts/implement-slice.md`
- `prompts/review-diff.md`
- `prompts/solidify-mistake.md`
- `prompts/update-status.md`
- `prompts/session-handoff.md`

## 可运行例子

`examples/tiny-python-cli` 是一个零第三方依赖的可运行例子：

```sh
cd examples/tiny-python-cli
./scripts/check.sh
./scripts/verify.sh
```

它展示了：

- 一条 issue tracker vertical slice
- domain tests
- check/verify scripts
- mistake ratchet for missing issue behavior

`examples/session-trace` 展示一次 session 如何留下 prompt、plan、iteration、review、status 和 result 证据。

## 框架自检

这个 repo 自身也有 harness：

```sh
sh scripts/check-consistency.sh
sh tests/test_audit.sh
sh tests/test_install.sh
sh tests/test_consistency.sh
```

`scripts/check-consistency.sh` 会检查 README、skills index、examples index 和核心文档是否对齐，避免 framework 文档逐渐漂移。

## 许可证

MIT
