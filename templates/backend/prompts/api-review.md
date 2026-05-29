# API 审查 Prompt

审查当前 backend/API 改动。

重点检查：

- 契约兼容性。
- 校验行为。
- 授权边界。
- 错误处理。
- 幂等性。
- 数据不变量。
- 迁移安全性。
- 缺失 integration tests。
- overfetching 或低效 queries。

先输出问题项，按严重级别排序。尽量包含文件路径、endpoint 名称或 data types。

除非审查发现具体问题，否则不要重写实现。
