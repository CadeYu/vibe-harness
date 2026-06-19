# 质量评分

质量评分回答一个问题：项目经过 agent session 后，是变强了还是变弱了？

单次 diff review 只能判断这轮改动够不够安全。`docs/quality.md` 记录的是长期健康度，让新会话能快速看到最脆弱的产品领域和架构层。

## 评分对象

建议按两张表维护：

- 产品领域：例如导入、搜索、问答、权限、结算。
- 架构层：例如 Interface、Application、Domain、Persistence、Runtime。

每个条目记录：

- 评级：A/B/C/D。
- 验证状态。
- Agent 可读性。
- 测试稳定性。
- 关键缺口。
- 上次更新时间。

## 评级标准

- A：验证通过，边界清晰，agent 容易接手，测试稳定。
- B：主要路径可用，存在少量文档、测试或边界缺口。
- C：部分可用，有明显风险或不稳定路径。
- D：不可用，或存在严重结构、数据、安全或验证问题。

## 更新时机

- 重要 feature 从 `in_progress` 变成 `passing` 后。
- 做完 bug fix 或 mistake ratchet 后。
- sensor matrix 明显变化后。
- benchmark 或 harness 简化实验后。

## 使用原则

质量评分不追求精确到数学分数。它的价值是让风险可见，让 agent 不要每次从零猜代码库哪里最危险。
