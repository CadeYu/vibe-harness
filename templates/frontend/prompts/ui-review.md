# UI 审查 Prompt

审查当前 frontend 改动。

重点检查：

- 布局稳定性。
- 响应式行为。
- 可访问性名称和焦点顺序。
- empty、loading、success 和 error states。
- 文本溢出。
- 交互可发现性。
- 不必要的视觉复杂度。
- 缺失 tests 或浏览器验证。

先输出问题项，按严重级别排序。尽量包含文件路径和具体 UI flows。

除非审查发现具体问题，否则不要重写实现。
