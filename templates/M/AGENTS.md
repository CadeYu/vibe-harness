# Project Agent Instructions

本项目使用 Vibe Harness M 级模板。M 级适合公开项目、长期个人项目和 1-3 个 agent 协作。

## Source of Truth

- Product intent: `docs/product.md`
- Architecture boundaries: `docs/architecture.md`
- Active work: `docs/plans/active.md`
- Current state: `docs/status.md`
- Mistake ratchet: `docs/mistake-log.md`
- Architecture decisions: `docs/decisions/`

## Rules

- 一次只实现一条 thin vertical slice。
- 改动必须绑定 acceptance criteria。
- 非平凡逻辑需要 tests。
- 完成前运行 `./scripts/check.sh`。
- 涉及 build、integration、persistence 或 public behavior 时运行 `./scripts/verify.sh`。
- 重复 failure 必须进入 `docs/mistake-log.md`。

## Verification

```sh
./scripts/check.sh
./scripts/verify.sh
```

