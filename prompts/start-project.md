# 启动项目

开始新项目，或把 Vibe Harness 加到已有项目时使用。

```text
Frame this project before implementation.

Inputs:
- Product idea:
- Target users:
- Target stack:
- Hard constraints:
- Known non-goals:
- Success criteria:

Tasks:
1. Read existing repository files if this is an existing project.
2. Fill or update docs/product.md with goal, non-goals, users, core flows, constraints, and acceptance criteria.
3. Fill or update docs/architecture.md with module boundaries, dependency direction, data ownership, error handling, and testing strategy.
4. Fill or update docs/plans/active.md with the first thin vertical slice.
5. Recommend the fast verification command and full verification command.
6. Record open questions only when they materially affect implementation correctness.

Constraints:
- Do not implement product code yet.
- Do not invent broad future scope.
- Keep the first slice small enough to verify end to end.

Output:
- Summary of docs updated
- First vertical slice
- Verification plan
- Open questions that block implementation, if any
```
