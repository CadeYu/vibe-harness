# Data Model Context

## Entities

| Entity | Purpose | Owner |
| --- | --- | --- |
| ExampleEntity | 替换成 entity name。 | 替换成 owning module。 |

## Invariants

- 记录必须始终成立的 rules。
- 如果可用，优先用 database constraints 保证 data integrity。
- 重要 invariants 需要对应 tests。

## Persistence Boundaries

描述哪些 modules 可以 read 或 write 每个 entity。

## Migrations

- Migrations 在实际可行时应 reversible。
- Data migrations 需要 rollback 或 recovery plan。
- Schema changes 需要更新 tests 和 docs。

## Verification

- 运行 migration checks。
- 用 realistic data 跑 integration tests。
- Review query shape，关注 overfetching 和 missing indexes。

