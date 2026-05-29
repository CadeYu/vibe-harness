# Session Trace

这个例子展示一次完整 vibe coding session 应该怎样留下 repo 内证据。

它不是可运行 app，而是一条可审查的开发轨迹：

```text
PROMPT -> PLAN -> ITERATION -> REVIEW -> STATUS -> RESULT
```

## 文件

| File | 作用 |
| --- | --- |
| `PROMPT.md` | 开始 session 时给 agent 的任务。 |
| `PLAN.md` | agent 写代码前形成的 active slice。 |
| `ITERATION-1.md` | 第一次实现、检查和失败处理记录。 |
| `REVIEW.md` | diff review 发现的问题和处理方式。 |
| `STATUS.md` | handoff 状态。 |
| `RESULT.md` | session 结束时的工程结果。 |

## 为什么重要

很多 vibe coding 失败不是因为 agent 没有产出，而是因为产出无法复盘：

- prompt 没有保存。
- plan 只在聊天里。
- 检查结果没有记录。
- review finding 没有跟踪。
- 下一轮不知道从哪里继续。

这个 trace 展示的模式是：每个关键动作都留下最小证据。
