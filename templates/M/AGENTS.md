# 项目 Agent 指令

本项目使用 Vibe Harness M 级模板。M 级适合公开项目、长期个人项目和 1-3 个 agent 协作。

## 事实来源

- 产品意图：`docs/product.md`
- 架构边界：`docs/architecture.md`
- 当前工作：`docs/plans/active.md`
- 当前状态：`docs/status.md`
- 错误固化：`docs/mistake-log.md`
- 架构决策：`docs/decisions/`

## 工作规则

- 一次只实现一条 thin vertical slice。
- 改动必须绑定 acceptance criteria。
- 非平凡逻辑需要 tests。
- 完成前运行 `./scripts/check.sh`。
- 涉及 build、integration、persistence 或 public behavior 时运行 `./scripts/verify.sh`。
- 重复 failure 必须进入 `docs/mistake-log.md`。

## 验证

```sh
./scripts/check.sh
./scripts/verify.sh
```
