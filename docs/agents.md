# Agents

Multi-agent 在 Vibe Harness 里不是默认编排系统，而是一套按风险触发的角色协议。

默认原则：

- 小 slice 使用单个 main agent。
- 风险升高时才引入 specialist agent。
- specialist agent 主要制造 backpressure，不负责扩大实现范围。
- 所有 agent 输出都必须回到 repo artifact、sensor、review finding 或 status 里。

## 角色模型

| 角色 | 触发时机 | 必读材料 | 产出 |
| --- | --- | --- | --- |
| Main Agent | 默认实现当前 slice。 | `AGENTS.md`、product、architecture、active plan、source、tests。 | 聚焦 diff、tests、status update。 |
| Reviewer Agent | diff 变大、公共行为改变、claim completion 前。 | 当前 diff、product、architecture、active plan、commands output。 | findings、风险、最小修复建议。 |
| Test Agent | 行为复杂、分支多、边界条件多、bug 修复。 | active plan、source、tests、mistake log。 | 缺失测试列表、建议 test cases。 |
| Architect Agent | 跨模块、API、数据库、持久化或长期抽象改变。 | architecture、ADR、diff、active plan。 | boundary review、ADR 建议、抽象风险。 |
| Sensor Agent | check/verify 不稳定、缺少验证入口、重复错误出现。 | scripts、CI、status、mistake log、sensors docs。 | sensor matrix、script/check 建议、ratchet 建议。 |

## 触发规则

| 情况 | 推荐 agent |
| --- | --- |
| 一条小而清楚的 slice | Main Agent |
| diff 超过一次快速 review 能看完的规模 | Reviewer Agent |
| 改动触及权限、数据一致性、错误处理或并发 | Test Agent + Reviewer Agent |
| 改动跨 API、database、domain boundary | Architect Agent |
| 验证命令缺失、慢、不稳定或覆盖不到风险 | Sensor Agent |
| 同类 agent mistake 第二次出现 | Sensor Agent + Ratchet |

## 输出约束

specialist agent 不应该直接接管实现，除非用户明确要求。它的默认输出应该是：

- findings
- missing tests
- boundary risks
- sensor gaps
- ratchet candidates
- exact next action

## 不要这样用 multi-agent

- 不要为了显得高级而默认并行多个 agent。
- 不要让多个 agent 同时修改同一批文件。
- 不要让 reviewer 变成第二个 implementer。
- 不要把 agent 输出留在聊天里不落 repo。
- 不要让 orchestration 替代 `scripts/check.sh` 和 `scripts/verify.sh`。

## 面试表达

可以这样解释：

```text
I use one main agent by default to preserve context. I add specialist agents only when risk rises: reviewer for diff pressure, test agent for missing behaviors, architect for boundaries, and sensor agent for verification gaps.
```

中文表达：

> 我默认使用单 agent 保持上下文连续。只有当 diff、行为复杂度、架构边界或验证风险升高时，我才临时引入 specialist agent。多 agent 的价值不是多写代码，而是制造独立审查压力。
