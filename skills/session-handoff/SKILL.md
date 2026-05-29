---
name: session-handoff
description: 在结束 session、切换 agent、上下文压缩或暂停工作前使用。
---

# Session Handoff（会话交接）

把有用项目状态保存在聊天上下文之外。

## 触发时机

以下情况使用这个 skill：

- 一个工作 session 即将结束。
- context 可能会压缩或重置。
- 另一个 agent 或人类会继续工作。
- worktree 里有有意义的未完成工作。

## 必读材料

- `AGENTS.md`
- `docs/product.md`
- `docs/architecture.md`
- `docs/plans/active.md`
- `docs/status.md`
- `docs/mistake-log.md`
- 当前改动文件或 git diff。
- 本 session 的命令输出。

## 流程

1. 识别已完成工作。
2. 识别未完成工作。
3. 记录已运行命令和结果。
4. 记录已知失败和风险。
5. 记录本 session 做过的决策。
6. 更新 `docs/status.md`。
7. 给出精确的建议下一步。

## 产出

- 更新后的 status。
- 改动文件摘要。
- 验证证据。
- 已知风险。
- 下一步动作。

## 边界

- 如果 worktree 有未提交改动，不要声称状态干净。
- 不要隐藏失败的检查。
- 不要让未来工作依赖私有聊天上下文。
