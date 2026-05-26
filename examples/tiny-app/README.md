# Tiny App Walkthrough

这个 walkthrough 展示一个小型 issue tracker 如何使用 Vibe Harness。

## Frame

Product goal:

```text
Users can create a project, create issues inside it, list issues, and close an issue.
```

First vertical slice:

```text
Create one project -> create one issue -> list issues for the project -> close the issue.
```

Acceptance criteria:

- 可以用 name 创建 project。
- 可以在 project 内创建 issue。
- 可以按 project 列出 issues。
- 可以 close issue。
- 这条 slice 有 automated tests。

## Slice

只让 agent 实现第一条路径：

```text
Implement the first vertical slice from docs/plans/active.md.
Keep persistence simple.
Add tests for creating, listing, and closing issues.
Run ./scripts/check.sh.
```

## Verify

运行：

```sh
./scripts/check.sh
```

如果 slice 改了 integration behavior，运行：

```sh
./scripts/verify.sh
```

## Review

使用 `prompts/review-diff.md`。

重点看：

- project 和 issue responsibilities 是否分清楚？
- close semantics 是否有 tests？
- invalid issue states 是否处理？
- agent 是否更新了 `docs/status.md`？

## Ratchet

Example failure:

```text
The agent allowed closing an issue that did not exist.
```

Smallest guardrail:

```text
Add a test for closing a missing issue and document the expected error in docs/product.md.
```

## Handoff

更新 `docs/status.md`：

```text
Current state:
Project and issue core flow works in tests.

Commands run:
./scripts/check.sh passed.

Known risks:
No authentication or multi-user access.

Next recommended action:
Add issue status filtering.
```

