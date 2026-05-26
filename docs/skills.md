# Skills

`skills/` 目录提供可复制的 agent operating procedures。

Prompts 是一次性、可粘贴的指令。Skills 是可复用流程，定义什么时候触发、要读什么、要做什么、产出什么、边界在哪里。

## Included Skills

| Skill | 作用 |
| --- | --- |
| `frame-project` | 把原始想法转成项目本地 context。 |
| `implement-slice` | 实现一条 thin vertical slice，并完成验证。 |
| `review-diff` | 在 claim completion 前审查改动。 |
| `solidify-mistake` | 把失败转成 durable guardrail。 |
| `session-handoff` | 在 session 之间保存项目状态。 |

## How to Use

如果你的 agent 环境支持 skills，把对应 skill folder 复制进去。

如果不支持，把 `SKILL.md` 当作操作清单使用。

## How to Adapt

一个好 skill 应该：

- 只做一件事
- 足够短，能快速读完
- 明确 required context
- 明确 outputs
- 明确 boundaries

不要创建只是重复长文档的 skill。真正有用的 skill 会改变 agent 的下一步行为。

