# 固化错误

当 agent 失败需要变成 durable guardrail 时使用。

```text
分析这次失败，并把它转成最小 durable guardrail。

失败：
- 发生了什么：
- 预期行为：
- 发生位置：
- 是否发生过类似问题：

失败分类：
- 需求理解错误
- 架构边界违规
- 漏掉边界条件
- 缺少验证
- 重复坏模式
- 不安全操作
- 上下文过期

选择最小 guardrail：
- 文档规则
- test case
- lint rule
- script check
- prompt update
- ADR update
- skill update

规则：
- 如果轻量 guardrail 已经能防止复发，不要选择更重的 guardrail。
- 如果这是第一次低影响问题，先记录，再考虑自动化。
- 如果这是重复问题或高影响问题，现在就添加具体 guardrail。

输出：
- 失败分类
- 根因
- 选择的 guardrail
- 需要更新的具体文件
- 后续验证命令或 review step
- 建议写入 `docs/mistake-log.md` 的条目
```
