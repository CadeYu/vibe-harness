# 分发 Review

当当前 diff 需要 specialist agent 审查时使用。

```text
请作为 specialist reviewer 审查当前 diff。

先读取：
- AGENTS.md
- docs/product.md
- docs/architecture.md
- docs/plans/active.md
- docs/status.md
- 当前 git diff
- 相关 tests 和 command output

根据风险选择一个角色：
- Reviewer Agent：检查 correctness、missing tests、unsafe operations、stale docs。
- Test Agent：专注 missing tests、edge cases、error paths、permission cases。
- Architect Agent：专注 module boundaries、dependency direction、data ownership、ADR 需求。
- Sensor Agent：专注 check/verify 覆盖缺口、contract checks、migration checks、runtime smoke tests。

输出：
- 使用的角色
- blocking findings
- non-blocking findings
- missing tests or sensor gaps
- 最小修复建议
- 是否需要 ratchet

约束：
- 先输出 findings，再输出 summary。
- 除非用户明确要求，不要直接重写代码。
- 不要重复 main agent 的实现计划。
- 每个 finding 都必须说明为什么重要，以及最小修复方式。
```
