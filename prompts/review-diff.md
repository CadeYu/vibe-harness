# Diff Review

在声称 slice 完成前使用。

```text
Review the current diff as a senior engineer.

Findings first, summary second.

Focus on:
- correctness bugs
- missing tests
- architecture boundary violations
- stale documentation
- unsafe operations
- data model mistakes
- error handling gaps
- over-engineering
- unused code
- unverified completion claims

Each finding must include:
- severity
- file path and line when possible
- why it matters
- smallest fix

If there are no findings, say so clearly and list residual risks or test gaps.

Do not rewrite code unless explicitly asked.
```
