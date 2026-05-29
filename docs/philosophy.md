# 理念

Vibe coding 的价值，是把“想法到实现”的距离压短。

它的问题，是当目标、约束、验证方式和项目状态都只存在聊天里时，速度会变成漂移：agent 看起来一直在写代码，但项目越来越难审查、难恢复、难维护。

Vibe Harness 的核心做法是：**把重要上下文放回 repo，把每一轮 AI coding 变成可验证循环。**

## 核心信念

AI coding agent 最适合在这样的项目里工作：

- context 清楚
- scope 足够小
- feedback 足够快
- diff 可审查
- state 不依赖聊天
- mistake 可以沉淀

开发者的角色不是逐行替 agent 打字，而是设计一个能让 agent 安全产出的工程回路。

## Harness 工程

Harness 是围绕 agent 的项目本地系统：

- context documents 说明什么重要
- prompts 定义下一步动作
- scripts 提供客观反馈
- reviews 捕捉判断错误
- ratchets 把失败变成护栏
- handoffs 保留跨 session 状态

目标不是完美自动化，而是可靠协作。

## Slow Is Fast

先 frame 再 coding，先 verify 再 claim completion，重复错误要 ratchet。它看起来比 one-shot prompt 慢，但能减少返工、漂移和隐藏风险。

