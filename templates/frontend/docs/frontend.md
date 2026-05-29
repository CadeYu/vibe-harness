# 前端上下文

## UI 目标

描述主要用户体验，以及哪些 workflows 必须快速、清晰、可靠。

## 设计约束

- Controls 要 discoverable。
- Layouts 需要在 mobile 和 desktop 上都稳定。
- 不要添加不服务 workflow 的装饰复杂度。
- 优先保证 accessible names、keyboard support 和 clear focus states。

## 组件边界

| 区域 | 职责 |
| --- | --- |
| Pages | Route-level composition 和 data loading。 |
| Components | 可复用 UI 和 interaction units。 |
| Domain UI | 绑定具体 product workflow 的组件。 |
| State | Shared client state 和 persistence boundaries。 |

## 交互状态

每个 user-facing flow 应定义：

- empty state
- loading state
- success state
- error state
- disabled or unavailable state

## 验证

- 为 logic-heavy components 运行 unit tests。
- 为 critical flows 运行 browser checks。
- 对 layout-sensitive changes 捕获 screenshots。
- 验证 mobile 和 desktop layouts。
