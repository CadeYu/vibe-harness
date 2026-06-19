# 规格

这份 spec 定义 Vibe Harness 这个 framework 本身。它回答三个问题：它要解决什么问题，它由哪些 artifact 组成，以及一个项目怎样判断自己已经进入可控的 vibe coding 状态。

## 问题

Vibe coding 的失败通常不是单点代码能力问题，而是系统缺少稳定反馈：

- 需求和边界只存在聊天里。
- agent 不能可靠知道哪些文件最重要。
- 完成标准没有被转成可执行命令。
- 错误修完后没有沉淀成下一轮护栏。
- session 切换后上下文丢失。

Vibe Harness 的目标是把这些隐性信息放回 repo，让 AI-assisted development 变成可重复、可审查、可恢复的工程循环。

## 非目标

- 不绑定某个 AI coding 产品。
- 不替代项目自己的测试框架、构建系统或 CI。
- 不把轻量项目改造成重平台。
- 不追求自动生成所有代码。
- 不把 prompt 数量当作质量指标。

## 核心抽象

| 抽象 | 说明 |
| --- | --- |
| Context | repo 内的产品、架构、计划、状态和决策记录。 |
| Sensor | 能暴露错误或风险的检查，例如 test、typecheck、contract check、smoke test、review prompt。 |
| Specialist Agent | 按风险触发的 reviewer、test、architect 或 sensor agent，用来制造独立审查压力。 |
| Ratchet | 把一次失败转成更持久的 guardrail，让同类错误更难再次发生。 |
| Skill | 可复用的 agent operating procedure，定义触发条件、读取材料、流程和产出。 |
| Handoff | 把当前状态写回 repo，让下一轮不依赖私有聊天上下文。 |
| Feature List | 机器可读的功能状态面，定义当前范围、验证步骤和完成证据。 |
| Quality Score | 长期质量快照，用来判断项目随 agent session 是变强还是变弱。 |
| Clean State | 会话结束前的可验证状态，要求检查可跑、状态已写、临时产物已处理。 |

## 必要产物

一个可用的 harness 至少需要：

- `AGENTS.md`：给 agent 的项目级工作规则。
- `docs/product.md`：目标、用户、非目标、核心流程和验收标准。
- `docs/status.md`：当前状态、最近改动、风险、运行过的命令和下一步。
- `feature_list.json`：功能范围、状态、验证步骤和 evidence。
- `scripts/check.sh`：快速检查入口。
- `scripts/clean-state.sh`：会话收尾检查入口。

推荐默认使用 M 级 harness，额外包含：

- `docs/architecture.md`
- `docs/plans/active.md`
- `docs/mistake-log.md`
- `docs/decisions/`
- `docs/quality.md`
- `docs/benchmark.md`
- `scripts/init-harness.sh`
- `scripts/verify.sh`

## 运行循环

```text
Frame -> Initialize -> Slice -> Verify -> Review -> Ratchet -> Clean State -> Handoff
```

这条 loop 是 framework 的行为协议，不是口号。每一步都应该留下 repo 内证据：

| 阶段 | Repo 证据 |
| --- | --- |
| Frame | product、architecture、active plan 被更新。 |
| Initialize | `scripts/init-harness.sh` 确认项目可运行、可检查、可接手。 |
| Slice | diff 聚焦在 `feature_list.json` 当前 feature。 |
| Verify | `scripts/check.sh`、`scripts/validate-feature-list.sh` 或 `scripts/verify.sh` 的结果被记录。 |
| Review | diff review 找到的问题被修复或记录为风险。 |
| Ratchet | mistake log、test、script、prompt、ADR 或 skill 被更新。 |
| Clean State | `scripts/clean-state.sh` 确认没有假完成和常见临时产物。 |
| Handoff | status 写明当前状态和下一步。 |

## 成功标准

一个项目的 harness 达到可用状态时，应该满足：

- 新 agent 能在十分钟内通过 repo 文件理解目标、边界和当前状态。
- 每次实现都有明确的 active slice。
- `feature_list.json` 中最多只有一个 `in_progress`，`passing` 有 evidence。
- 至少有一个快速检查命令可以运行。
- 重要失败能被归类并转成 guardrail。
- session 结束后，下一轮能从 `docs/status.md` 继续。

## 设计倾向

Vibe Harness 偏向小而明确的 artifacts。能用一个脚本解决的问题，不引入平台；能用一个文档规则解决的问题，不急着写复杂自动化。

这个 framework 的判断标准不是“看起来专业”，而是它能不能让 agent 的错误更早暴露、更容易定位、更难重复。
