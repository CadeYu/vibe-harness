# 会话交接

在结束 session、切换 agent 或上下文可能压缩前使用。

```text
为下一轮 agent session 准备会话交接。

读取：
- `AGENTS.md`
- `docs/product.md`
- `docs/architecture.md`
- `docs/plans/active.md`
- `feature_list.json`
- `docs/status.md`
- `docs/mistake-log.md`
- 当前 git diff 或改动文件

交接前：
- 运行 `./scripts/clean-state.sh`，或记录为什么暂时不能运行。

更新 `docs/status.md`，包含：
- 已完成内容
- 未完成内容
- 当前 feature 状态和 evidence
- 已运行命令
- 已知失败
- 本轮决策
- 建议下一步

输出：
- 当前状态
- 改动文件
- 验证证据
- 风险
- 精确下一步

约束：
- 不要隐藏失败的检查。
- 不要依赖只存在聊天里的上下文。
- 如果 worktree 有未提交改动，不要编造干净状态。
```
