# 项目 Agent 指令

这是最小 Vibe Harness。目标是让 agent 有清楚入口、稳定验证命令和 session handoff。

## 事实来源

- 产品上下文：`docs/product.md`
- 功能状态：`feature_list.json`
- 当前状态：`docs/status.md`

## 工作规则

- 一次只做一个小改动。
- 改动前先读 `docs/product.md`。
- 从 `feature_list.json` 选择当前唯一 feature。
- 完成前运行 `./scripts/check.sh`。
- 更新 feature 状态前运行 `./scripts/validate-feature-list.sh .`。
- 结束前运行 `./scripts/clean-state.sh`。
- 结束前更新 `docs/status.md`。

## 验证

```sh
./scripts/check.sh
./scripts/validate-feature-list.sh .
./scripts/clean-state.sh
```
