# 项目 Agent 指令

本项目使用 Vibe Harness。这个文件是 context map，不是完整文档库。

## 事实来源

- 产品意图：`docs/product.md`
- 架构边界：`docs/architecture.md`
- 当前任务：`docs/plans/active.md`
- 当前状态：`docs/status.md`
- 错误固化：`docs/mistake-log.md`
- 架构决策：`docs/decisions/`

## 工作规则

- 一次只实现一条 thin vertical slice。
- 改动要小、可审查，并绑定 acceptance criteria。
- 优先遵循项目已有模式，不要轻易引入新抽象。
- 行为、架构或工作流变化时，同步更新 docs。
- 非平凡逻辑和用户可见行为需要 tests。
- 没有运行相关 verification command，不要 claim completion。

## 验证命令

快速检查：

```sh
./scripts/check.sh
```

完整验证：

```sh
./scripts/verify.sh
```

## Review 重点

完成前检查：

- missing tests。
- architecture boundary violations。
- stale docs。
- unused code。
- unsafe operations。
- over-engineering。
- unverified claims。

## 错误固化

当 agent failure 重复出现，或者暴露高信号风险时，更新 `docs/mistake-log.md`，并添加最小 durable guardrail：

- documentation rule。
- test case。
- lint rule。
- script check。
- prompt update。
- ADR update。
- skill update。
