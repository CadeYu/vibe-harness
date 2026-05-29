# 架构上下文

## 系统形态

描述主要 modules，以及它们如何通信。

## 模块边界

| 模块 | 职责 | 禁止事项 |
| --- | --- | --- |
| Core | 拥有 domain rules 和 invariants。 | 依赖 UI 或 transport details。 |
| Interface | 向用户或外部 caller 展示 inputs 和 outputs。 | 拥有 domain rules。 |
| Persistence | 存储和读取数据。 | 把 storage details 泄漏到 domain logic。 |

## 依赖方向

依赖应该指向更稳定的 domain concepts。

```text
Interface -> Application -> Domain
Persistence -> Application -> Domain
```

按项目真实架构调整这张图。

## 数据归属

描述每个重要 data type 和 persistence concern 由哪个 module 拥有。

## 错误处理

- Domain errors 应该 explicit 且 testable。
- Interface errors 应该适合用户理解。
- Infrastructure errors 应该保留足够 debugging context。

## 测试策略

- Unit tests 覆盖 domain rules 和 pure functions。
- Integration tests 覆盖 module boundaries 和 persistence。
- End-to-end 或 manual QA 覆盖 critical user flows。

## 扩展点

列出预计会变化的区域，以及架构如何让这些变化保持局部化。
