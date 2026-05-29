# Review 记录

## Findings 列表

### Medium：CLI 行为缺少明确输出契约

影响：

如果输出格式没有被测试固定，后续 agent 可能在重构时改变用户可见行为。

最小修复：

增加 CLI behavior test，或者在 `docs/product.md` 记录 output contract。

状态：

已增加 behavior test。

## 剩余风险

- 目前仍是 in-memory store，没有 persistence 风险。
- 没有并发路径。
- 没有外部 API contract。
