# 参考材料

这份文档记录 Vibe Harness 从外部材料吸收了什么。它不是资料堆积，而是把参考材料转成 framework decision。

## rayjun/ai-coding-context

地址：[rayjun/ai-coding-context](https://github.com/rayjun/ai-coding-context)

这个 repo 的主要启发是：AI coding 的上下文应该 repo-native，而不是只存在聊天窗口。对 Vibe Harness 的影响：

- 强化 `AGENTS.md` 的地位。
- 把 product、architecture、status 和 active plan 放进项目文件。
- 让新 session 先读 repo context，再写代码。

吸收方式：

- `templates/*/AGENTS.md`
- `templates/*/docs/status.md`
- `prompts/session-handoff.md`
- `skills/session-handoff`

## deusyu/harness-engineering

地址：[deusyu/harness-engineering](https://github.com/deusyu/harness-engineering)

这个 repo 的主要启发是：harness 不只是 prompt，而是由 guides、sensors、skills、hooks、sandbox、orchestration 和 backpressure 组成的系统。

对 Vibe Harness 的影响：

- 增加 `docs/spec.md`，把 framework 本身定义清楚。
- 增加 `docs/sensors.md`，把检查从前端 lint 扩展到后端、数据、协议、运行时和安全。
- 增加 `docs/agents.md` 和 `docs/orchestration.md`，把 multi-agent 约束为按风险触发的 backpressure。
- 增加 consistency check，让文档索引和实际文件保持一致。
- 把 mistake ratchet 视为核心机制，而不是复盘笔记。

没有吸收的部分：

- 不引入重 orchestration 平台。
- 不默认多 agent 并行。
- 不把研究归档结构搬进每个业务项目。

## Porting Mihomo to Rust with Claude

地址：[Porting Mihomo to Rust with Claude](https://maxlv.net/blog/porting-mihomo-to-rust-with-claude/)

这篇文章的主要启发是：大规模 AI coding 需要明确的任务边界、可验证的迁移路径和持续 review。对 Vibe Harness 的影响：

- 强调 thin vertical slice，而不是一次性大改。
- 强调 review 和 verification 必须进入主循环。
- 强调 handoff 和状态记录，避免长 session 后丢失上下文。

吸收方式：

- `docs/workflow.md`
- `prompts/implement-slice.md`
- `prompts/review-diff.md`
- `examples/session-trace/`

## 参考材料选择规则

未来新增参考材料时，必须回答：

- 它解决了哪个 vibe coding 失败模式？
- 我们吸收的是 concept、artifact 还是 workflow？
- 它会进入 docs、scripts、prompts、skills 还是 examples？
- 有没有引入不必要复杂度？

参考材料只有被转成 repo artifact，才算真正进入 harness。
