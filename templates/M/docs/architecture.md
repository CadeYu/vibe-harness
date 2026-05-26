# Architecture Context

## System Shape

描述主要 modules 和通信方式。

## Module Boundaries

| Module | Responsibility | Must Not Do |
| --- | --- | --- |
| Domain | Own rules and invariants. | Depend on UI or storage. |
| Interface | Present inputs and outputs. | Own domain rules. |
| Persistence | Store and retrieve data. | Leak storage concerns. |

## Testing Strategy

- Unit tests cover domain rules.
- Integration tests cover boundaries.
- Manual QA covers critical user flows.

