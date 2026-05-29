# 架构上下文

## 系统形态

描述主要 modules 和通信方式。

## 模块边界

| 模块 | 职责 | 禁止事项 |
| --- | --- | --- |
| Domain | 拥有业务规则和不变量。 | 依赖 UI 或存储细节。 |
| Interface | 展示输入和输出。 | 拥有业务规则。 |
| Persistence | 存储和读取数据。 | 把存储细节泄漏到 domain logic。 |

## 测试策略

- Unit tests 覆盖 domain rules。
- Integration tests 覆盖模块边界。
- Manual QA 覆盖关键用户流程。
