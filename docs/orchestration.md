# Orchestration

Orchestration 定义什么时候单 agent，什么时候 multi-agent，以及 agent 之间如何交接。

Vibe Harness 的 orchestration 是轻量协议，不是重平台。它依赖 repo 文件、prompts、skills、scripts 和 status，而不是隐藏聊天状态。

## 默认路径

```text
Frame -> Main Agent Slice -> Check -> Review -> Ratchet -> Handoff
```

小项目和面试现场默认走这条路径。它的优点是上下文连续、噪音低、速度快。

## 风险升级路径

当风险升高时，从单 agent 升级为 specialist review：

```text
Main Agent
  -> Reviewer Agent
  -> Test Agent
  -> Architect Agent
  -> Sensor Agent
  -> Main Agent fixes
  -> Verify
  -> Handoff
```

不是每次都启用全部角色，只启用能降低当前风险的角色。

## 升级矩阵

| 风险信号 | 升级动作 |
| --- | --- |
| diff 太大 | 使用 `prompts/dispatch-review.md` 让 Reviewer Agent 审查。 |
| tests 明显不足 | 让 Test Agent 输出 missing tests。 |
| 跨模块或跨服务 | 让 Architect Agent 审查 boundary 和 ADR 需求。 |
| check/verify 不覆盖关键风险 | 使用 `prompts/design-sensors.md` 设计 sensor matrix。 |
| 重复失败 | 使用 `prompts/solidify-mistake.md` 转成 ratchet。 |

## 数据流

```text
Repo context -> Main Agent -> Diff
Diff + docs -> Specialist Agent -> Findings
Findings -> Main Agent fix
Fix -> Sensors
Sensors -> Status + Ratchet
```

关键约束：

- Specialist Agent 读取 repo 和 diff，不依赖口头摘要。
- Findings 必须可行动，包含最小修复。
- 修复后必须运行 sensor。
- session 结束前必须更新 status。

## 输出格式

每次 orchestration 都应该留下四类证据：

- 哪个风险触发了 specialist agent。
- 哪个 agent 被调用。
- 它输出了哪些 findings 或 sensor gaps。
- 哪些修复、验证或 ratchet 已经落回 repo。

## S / M / L 分层

| Size | Orchestration 方式 |
| --- | --- |
| S | 单 agent，手动 review prompt。 |
| M | 单 agent 主导，按需调用 reviewer/test/sensor prompt。 |
| L | 明确角色协议、sensor matrix、ratchet cases 和 CI gate。 |

## 退出条件

multi-agent session 必须有明确退出条件：

- 所有 blocker findings 已修复或记录为风险。
- `scripts/check.sh` 已运行。
- 需要完整验证时，`scripts/verify.sh` 已运行。
- `docs/status.md` 已记录 commands、risks 和 next action。

否则不要 claim completion。
