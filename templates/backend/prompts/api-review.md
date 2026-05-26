# API Review Prompt

Review 当前 backend/API changes。

重点检查：

- contract compatibility
- validation behavior
- authorization boundaries
- error handling
- idempotency
- data invariants
- migration safety
- missing integration tests
- overfetching or inefficient queries

先输出 findings，按 severity 排序。尽量包含 file paths、endpoint names 或 data types。

除非 review 发现具体问题，否则不要重写 implementation。

