# 实现 Slice

实现一条已经定框的 vertical slice 时使用。

```text
实现 `docs/plans/active.md` 中定义的当前 vertical slice。

编辑前：
1. 阅读 `AGENTS.md`。
2. 阅读 `docs/product.md`。
3. 阅读 `docs/architecture.md`。
4. 阅读 `docs/plans/active.md`。
5. 检查相关现有代码。

实现约束：
- 改动必须聚焦当前 slice。
- 遵循项目已有模式。
- 除非 `docs/architecture.md` 明确允许，否则不要把 domain logic 放进 interface 或 persistence code。
- 非平凡行为需要新增或更新 tests。
- 实现后更新 `docs/status.md`。

验证：
- 声称完成前运行 `./scripts/check.sh`。
- 如果 `./scripts/check.sh` 失败，总结失败现象、根因和下一步修复。
- 当改动触及构建、集成、持久化或公开行为时，运行 `./scripts/verify.sh`。

输出：
- 改动文件
- 已实现行为
- 新增或更新的 tests
- 已运行命令和结果
- 已知风险或后续工作
```
