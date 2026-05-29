# 面试 Playbook

这份 playbook 用于现场 vibe coding 面试。

## 开场表达

```text
I do not just ask the agent to code. I put a small harness around it: context, constraints, sensors, review, and a ratchet for mistakes.
```

中文解释可以这样说：

> 我不是直接让 agent 写代码，而是先给它一个小型工程轨道：context、constraints、verification sensors、review 和 mistake ratchet。

## 前五分钟

先 frame：

1. 明确 goal。
2. 说清 non-goals。
3. 定义一条 thin vertical slice。
4. 确认 verification command。
5. 把 plan 写进项目文件。

可以边操作边说：

```text
I want the agent to work against explicit acceptance criteria, not vibes alone.
```

## 实现过程中

使用主循环：

```text
Frame -> Slice -> Verify -> Review -> Ratchet -> Handoff
```

可以这样讲你的判断：

- "This is the smallest vertical slice that proves the path."
- "I am adding the check before calling it done."
- "This failure should become a test, not just a chat note."
- "I am updating status so another session can resume safely."

## 面试官应该看到什么

面试官应该看到：

- 你先控制 scope，再 prompt。
- 你会 inspect 和 verify agent output。
- 你避免大范围重写。
- 你能把失败变成系统改进。
- 你能解释工程 tradeoffs。

## 如果 agent 失败

不要慌。失败本身可以展示 harness 思维。

```text
This is exactly why I keep a mistake ratchet. I will classify the failure, fix the immediate issue, and add the smallest guardrail that prevents recurrence.
```

然后更新对应 artifact：

- docs
- tests
- script checks
- prompt rules
- skills

## 收尾总结

最后可以这样收束：

```text
The value is not that the agent wrote code quickly. The value is that the repository now contains enough context, checks, and state for the next change to be safer.
```

