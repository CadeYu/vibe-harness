# 项目 Agent 指令

本项目使用 Vibe Harness M 级模板。M 级适合公开项目、长期个人项目和 1-3 个 agent 协作。

## 事实来源

- 产品意图：`docs/product.md`
- 架构边界：`docs/architecture.md`
- 当前工作：`docs/plans/active.md`
- 功能状态：`feature_list.json`
- 当前状态：`docs/status.md`
- 错误固化：`docs/mistake-log.md`
- 架构决策：`docs/decisions/`

## 工作规则

- 一次只实现一条 thin vertical slice。
- 一次只允许一个 feature 处于 `in_progress`。
- 开始实现前运行 `./scripts/init-harness.sh`。
- 改动必须绑定 acceptance criteria。
- 非平凡逻辑需要 tests。
- 完成前运行 `./scripts/check.sh`。
- 涉及 build、integration、persistence 或 public behavior 时运行 `./scripts/verify.sh`。
- 重复 failure 必须进入 `docs/mistake-log.md`。
- 没有 evidence，不要把 feature 标成 `passing`。
- 结束 session 前运行 `./scripts/clean-state.sh`。

## 验证

```sh
./scripts/init-harness.sh
./scripts/check.sh
./scripts/validate-feature-list.sh .
./scripts/verify.sh
./scripts/clean-state.sh
```
