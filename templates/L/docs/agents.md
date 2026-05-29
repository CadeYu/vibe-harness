# Agents

L 级 harness 支持按风险触发的 multi-agent workflow。

默认仍然使用一个 main agent。只有风险升高时，才启用 specialist agent。

## 角色

| 角色 | 触发时机 | 输出 |
| --- | --- | --- |
| Main Agent | 默认实现当前 slice。 | focused diff、tests、status update。 |
| Reviewer Agent | claim completion 前，或 diff 变大。 | findings、风险、最小修复建议。 |
| Test Agent | 行为复杂、bug fix、边界多。 | missing tests、edge cases、error paths。 |
| Architect Agent | 跨模块、API、database、domain boundary。 | boundary review、ADR 建议。 |
| Sensor Agent | check/verify 不足或重复错误。 | sensor gaps、script/check 建议、ratchet 建议。 |

## 规则

- multi-agent 不是默认模式。
- specialist agent 默认不直接实现代码。
- 每个 finding 都必须可行动。
- 每次 specialist review 后，main agent 负责修复或记录风险。
- session 结束前必须更新 `docs/status.md`。
