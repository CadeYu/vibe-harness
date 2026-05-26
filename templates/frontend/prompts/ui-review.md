# UI Review Prompt

Review 当前 frontend changes。

重点检查：

- layout stability
- responsive behavior
- accessibility names and focus order
- empty, loading, success, and error states
- text overflow
- interaction affordances
- unnecessary visual complexity
- missing tests or browser verification

先输出 findings，按 severity 排序。尽量包含 file paths 和具体 UI flows。

除非 review 发现具体问题，否则不要重写 implementation。

