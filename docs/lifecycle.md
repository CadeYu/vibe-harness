# 生命周期

Vibe Harness 把一次 agent session 拆成三个生命周期边界：初始化、实现、干净收尾。

## 为什么要独立出来

如果初始化和实现混在一起，agent 很容易一边修环境、一边写功能，最后留下未经验证的半成品。独立初始化阶段的目标不是产出产品功能，而是证明后续开发有稳定地基。

如果收尾只靠聊天总结，下一轮 session 会重新猜：哪些通过了，哪些只是看起来完成，哪些文件是临时产物。干净收尾把这些判断变成脚本和状态文件。

## 初始化阶段

安装 harness 后先运行：

```sh
./scripts/init-harness.sh
```

这个脚本应该确认：

- 必要 harness 文件存在。
- `feature_list.json` 可解析。
- 快速检查能跑。
- 新 session 能从 repo 文件知道下一步。

初始化阶段不要写产品代码。它的完成标准是“项目可接手”，不是“功能可用”。

## 实现阶段

实现阶段只推进 `feature_list.json` 中的一个 feature。每次状态变化都应该被验证：

```sh
./scripts/check.sh
./scripts/validate-feature-list.sh .
```

触及构建、集成、持久化、部署或公开行为时，再运行：

```sh
./scripts/verify.sh
```

## 干净收尾阶段

交接前运行：

```sh
./scripts/clean-state.sh
```

这个脚本至少检查：

- 功能清单没有假 `passing`。
- 快速检查能跑。
- 没有常见临时产物残留。
- 状态文件的未提交变化是有意的。

脚本通过以后，再更新 `docs/status.md`，记录当前 feature、验证证据、风险和下一步。

## 面试时怎么说

可以这样表达：

> 我不会让 agent 一上来就写功能。我先让它初始化项目，确认运行、验证和状态文件都可用；实现时只推进一个 feature；结束前用 clean-state 检查，确保下一轮 session 不需要重新猜状态。

这就是把 vibe coding 从单次 prompt，变成可恢复的软件生命周期。
