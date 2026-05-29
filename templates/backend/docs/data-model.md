# 数据模型上下文

## 实体

| 实体 | 目的 | 归属模块 |
| --- | --- | --- |
| ExampleEntity | 替换成 entity name。 | 替换成 owning module。 |

## 不变量

- 记录必须始终成立的 rules。
- 如果可用，优先用 database constraints 保证 data integrity。
- 重要 invariants 需要对应 tests。

## 持久化边界

描述哪些 modules 可以 read 或 write 每个 entity。

## 迁移

- Migrations 在实际可行时应 reversible。
- Data migrations 需要 rollback 或 recovery plan。
- Schema changes 需要更新 tests 和 docs。

## 验证

- 运行 migration checks。
- 用 realistic data 跑 integration tests。
- Review query shape，关注 overfetching 和 missing indexes。
