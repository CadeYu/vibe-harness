# 功能清单

`feature_list.json` 是 Vibe Harness 的范围和完成状态原语。它不是备忘录，而是 agent、review、sensor 和 handoff 共同依赖的事实来源。

## 为什么需要

没有功能清单时，agent 会用自己的标准判断“做完了”。这通常会导致：

- 一次启动多个半成品。
- 代码写了但没有验证证据。
- 新会话不知道哪个功能可用、哪个只是看起来完成。
- `docs/status.md`、active plan 和聊天记录互相漂移。

功能清单把“该做什么”和“怎么算完成”变成机器可读的状态面。

## 最小字段

每个 feature 至少包含：

| 字段 | 用途 |
| --- | --- |
| `id` | 稳定短标识，便于 status、commit 和 review 引用。 |
| `title` | 人类可读的功能名。 |
| `user_visible_behavior` | 用户或调用方能观察到的行为。 |
| `status` | `not_started`、`in_progress`、`blocked` 或 `passing`。 |
| `verification` | 验证这个行为的步骤或命令。 |
| `evidence` | 通过验证后的证据，例如命令、commit、截图或日志路径。 |

## 状态规则

- 同一时间只能有一个 `in_progress`。
- `passing` 必须有 evidence。
- 没有跑验证，不允许把状态改成 `passing`。
- `blocked` 必须在 `notes` 或 `docs/status.md` 里说明阻塞原因。
- 新增范围时，优先新增 feature，而不是把大 feature 越写越宽。

## 校验

项目应提供：

```sh
./scripts/validate-feature-list.sh .
```

这个脚本至少检查：

- JSON 可解析。
- feature 列表非空。
- 状态值合法。
- 只有一个 `in_progress`。
- `passing` 有 evidence。
- 每个 feature 有验证步骤。

## 与主循环的关系

| 阶段 | 如何使用 feature list |
| --- | --- |
| Frame | 写入第一批 feature，并定义验证方式。 |
| Slice | 选择优先级最高的未完成 feature。 |
| Verify | 跑该 feature 的验证步骤。 |
| Review | 检查是否存在假 `passing` 或缺失 evidence。 |
| Ratchet | 如果某类 feature 总失败，补 sensor 或拆小粒度。 |
| Handoff | 把当前 feature 状态写回 `docs/status.md`。 |
