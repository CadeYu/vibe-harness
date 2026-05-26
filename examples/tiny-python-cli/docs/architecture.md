# Architecture Context

## System Shape

`tiny_issues.core` 拥有 domain behavior。`tiny_issues.cli` 只负责展示一条 happy path。

## Module Boundaries

| Module | Responsibility | Must Not Do |
| --- | --- | --- |
| `core.py` | Own project and issue behavior. | Print CLI output. |
| `cli.py` | Present a tiny demo flow. | Own domain rules. |

## Testing Strategy

`tests/test_core.py` 覆盖 domain behavior 和 missing issue failure。

