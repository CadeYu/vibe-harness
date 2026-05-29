# Orchestration

L 级 harness 使用轻量 orchestration 协议：

```text
Main Agent -> Specialist Review -> Main Agent Fix -> Sensors -> Handoff
```

## 升级条件

| 风险信号 | 动作 |
| --- | --- |
| diff 变大 | 调用 Reviewer Agent。 |
| tests 不足 | 调用 Test Agent。 |
| 跨模块或数据边界 | 调用 Architect Agent。 |
| check/verify 覆盖不足 | 调用 Sensor Agent。 |
| 重复错误 | 进入 ratchet。 |

## 交接要求

每次 specialist review 后，`docs/status.md` 必须记录：

- 使用了哪个 agent。
- 触发原因是什么。
- 有哪些 blocking findings。
- 哪些问题已修复。
- 哪些风险被保留。
- 运行过哪些 commands。

## 退出条件

不要在以下条件满足前 claim completion：

- blocking findings 已处理或记录。
- `./scripts/check.sh` 已运行。
- 需要完整验证时，`./scripts/verify.sh` 已运行。
- `docs/status.md` 已更新。
