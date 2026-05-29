# API 上下文

## API 目标

描述 external 或 internal callers 需要 API 提供什么。

## 资源

| 资源 | 目的 | 归属模块 |
| --- | --- | --- |
| ExampleResource | 替换成 resource name。 | 替换成 owning module。 |

## 契约

每个 endpoint 或 handler 记录：

- method or command name
- input shape
- output shape
- authorization requirements
- error cases
- idempotency expectations

## 错误策略

- Validation errors 应 explicit and actionable。
- Authorization failures 不应泄漏 private data。
- Unexpected failures 应在 logs 中保留 diagnostic context。

## 验证

- Unit tests 覆盖 domain rules。
- Integration tests 覆盖 API boundaries。
- Contract changes 需要同步更新 docs 和 callers。
