---
name: review-diff
description: Use before claiming completion, merging, or handing off a change.
---

# Review Diff

以 senior engineer 标准 review 当前 diff。

## Trigger

以下情况使用这个 skill：

- code or docs were changed
- a slice is believed to be complete
- the user asks for review
- a handoff needs risk assessment

## Required Reads

- current diff
- `docs/product.md`
- `docs/architecture.md`
- `docs/plans/active.md`
- relevant tests
- command outputs if available

## Process

1. 识别本次 change 的 behavioral contract。
2. 优先检查 correctness issues。
3. 对照 acceptance criteria 检查 tests。
4. 对照 `docs/architecture.md` 检查 architecture boundaries。
5. 检查 docs 和 status 是否 stale。
6. Findings first，按 severity 排序。
7. 如果没有 findings，说明 residual risks 和 verification gaps。

## Finding Format

每个 finding 包含：

- severity
- file path and line when possible
- issue
- impact
- smallest fix

## Review Focus

- correctness bugs
- missing tests
- stale docs
- boundary violations
- unsafe operations
- data model mistakes
- error handling gaps
- over-engineering
- unused code
- unverified completion claims

## Boundaries

- 除非明确要求，review 时不要 rewrite code。
- 不要把 findings 埋在长 summary 后面。
- failed checks 未解释清楚前，不要 approve work。

