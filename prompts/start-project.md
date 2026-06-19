# 启动项目

开始新项目，或把 Vibe Harness 加到已有项目时使用。

```text
在实现前为这个项目定框。

输入：
- 产品想法：
- 目标用户：
- 目标技术栈：
- 硬约束：
- 已知非目标：
- 成功标准：

任务：
1. 如果这是已有项目，先阅读现有仓库文件。
2. 填写或更新 `docs/product.md`，包含目标、非目标、用户、核心流程、约束和验收标准。
3. 填写或更新 `docs/architecture.md`，包含模块边界、依赖方向、数据归属、错误处理和测试策略。
4. 填写或更新 `docs/plans/active.md`，定义第一条 thin vertical slice。
5. 填写或更新 `feature_list.json`，至少写入第一条可验证 feature。
6. 推荐初始化命令、快速验证命令、功能状态校验命令、完整验证命令和收尾检查命令。
7. 在实现任何 product code 前，运行或要求下一步运行 `./scripts/init-harness.sh`。
8. 只记录会实质影响实现正确性的开放问题。

约束：
- 现在不要实现 product code。
- 不要发明宽泛的未来范围。
- 第一条 slice 要足够小，能够 end-to-end verify。

输出：
- 已更新文档摘要
- 第一条 vertical slice
- 第一条 feature 及其 verification/evidence 规则
- 验证计划
- 初始化和收尾检查计划
- 阻碍实现的开放问题，如果存在
```
