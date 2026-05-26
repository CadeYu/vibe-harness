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

## The Loop

```text
Frame -> Slice -> Verify -> Review -> Ratchet -> Handoff
```

| Stage | 作用 |
| --- | --- |
| Frame | 定义目标、非目标、架构边界和验证方式。 |
| Slice | 只实现一条可端到端验证的 thin vertical slice。 |
| Verify | 用项目内脚本把“感觉完成”变成证据。 |
| Review | 审查 diff，优先找 bug、漏测、越界和过度设计。 |
| Ratchet | 把重复错误固化成 docs、tests、lint、scripts、prompts、ADR 或 skills。 |
| Handoff | 把状态写回 repo，让下一轮不依赖隐藏聊天上下文。 |

## Quick Start

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

1. 用 `prompts/implement-slice.md` 实现一条 slice。
2. 运行 `scripts/check.sh`。
3. 用 `prompts/review-diff.md` 做 diff review。
4. 出错时用 `prompts/solidify-mistake.md` 固化错误。
5. 结束前用 `prompts/session-handoff.md` 更新状态。

## Repository Map

```text
scripts              audit/install lightweight tools
tests                shell tests for framework scripts
templates/S          minimal harness for interviews and small projects
templates/M          default harness for public and long-lived solo projects
templates/L          team and long-running project extension
templates/base       generic starter harness
templates/frontend   frontend docs and UI review prompt
templates/backend    API and data model docs
templates/fullstack  end-to-end user flow docs
prompts              pasteable prompts for AI coding agents
skills               reusable operating procedures for skill-aware agents
docs                 framework docs, workflow, and interview playbook
examples             small walkthroughs and runnable examples
```

## 选择 S / M / L

| Size | 适合场景 | 包含内容 |
| --- | --- | --- |
| S | 面试现场、个人小项目、刚起步 repo | `AGENTS.md`、product/status docs、`check.sh` |
| M | 默认推荐，公开项目或长期个人项目 | S + architecture、active plan、mistake log、ADR、`verify.sh` |
| L | 团队项目、多 agent、长期维护 | M + PR template、CI、ratchet cases、harness audit wrapper |

从小开始。需要更强约束时再升级，不要一开始把简单项目压重。

## 为什么它是 Harness

一个真正有用的 harness 不只是 prompt 集合，它至少需要三类东西：

- sensors：例如 `scripts/check.sh` 和 `scripts/verify.sh`
- state：例如 `docs/status.md`、`docs/plans/active.md`、ADR
- ratchets：把失败变成下次更难再犯的护栏

目标不是让 AI “更听话”，而是让项目对错误更敏感。

## Skills

第一版内置 5 个 skills：

- `frame-project`
- `implement-slice`
- `review-diff`
- `solidify-mistake`
- `session-handoff`

如果你的 AI coding 环境支持 skills，可以直接复制对应目录。如果不支持，也可以把 `SKILL.md` 当作操作清单使用。

## Runnable Example

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

## 面试用法

现场 vibe coding 时可以这样开场：

> 我不是直接让 agent 写代码。我会先给它一个小型 harness：context、constraints、sensors、review 和 mistake ratchet。

然后展示主循环：

```text
Frame -> Slice -> Verify -> Review -> Ratchet -> Handoff
```

这能说明你不是在随机生成代码，而是在构建一个可验证的软件生产循环。

## License

MIT
