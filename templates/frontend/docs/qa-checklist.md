# 前端 QA 检查清单

UI work 标记完成前使用这份 checklist。

## 布局

- Text 不溢出 containers。
- Controls 在 hover、focus、loading 和 error states 下保持稳定。
- Mobile 和 desktop 都能看到关键 actions。

## 可访问性

- Interactive elements 有 accessible names。
- Keyboard focus 可见且顺序合理。
- Form errors 显示在相关 input 附近。

## 行为

- Empty、loading、success、error states 都已处理。
- Destructive actions 有明确 confirmation。
- Validation 失败时保留 user input。

## 验证 Evidence

记录：

- command outputs
- browser paths checked
- screenshots captured
- known residual risks

