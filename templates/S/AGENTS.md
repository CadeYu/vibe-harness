# Project Agent Instructions

这是最小 Vibe Harness。目标是让 agent 有清楚入口、稳定验证命令和 session handoff。

## Source of Truth

- Product context: `docs/product.md`
- Current state: `docs/status.md`

## Rules

- 一次只做一个小改动。
- 改动前先读 `docs/product.md`。
- 完成前运行 `./scripts/check.sh`。
- 结束前更新 `docs/status.md`。

## Verification

```sh
./scripts/check.sh
```

