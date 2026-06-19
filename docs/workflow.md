# 工作流

日常开发使用这条主循环：

```text
Frame -> Initialize -> Slice -> Verify -> Review -> Ratchet -> Clean State -> Handoff
```

## 1. Frame

编码前先更新：

- `docs/product.md`
- `docs/architecture.md`
- `docs/plans/active.md`
- `feature_list.json`

输出应该是一条很小的 vertical slice，并且有可观察的 acceptance criteria。

新项目可以先安装默认 M 级 harness：

```sh
./scripts/install.sh /path/to/project --size M
```

已有项目可以先审计：

```sh
./scripts/audit.sh /path/to/project
```

## 2. Initialize

Frame 之后先运行初始化入口：

```sh
./scripts/init-harness.sh
```

初始化阶段只确认项目可运行、可检查、可接手，不实现产品功能。它应该证明：

- 必要 harness 文件存在。
- 功能清单可解析。
- 快速检查能跑。
- 新 session 能从 repo 文件知道下一步。

## 3. Slice

只实现 active slice。

好的 slice 是一条很细但完整的路径：

```text
UI or API -> application behavior -> domain rule -> persistence or state -> verification
```

避免“build the dashboard”这种宽泛任务。优先做“create and list one item”这种能证明路径的任务。

实现前从 `feature_list.json` 选择优先级最高的 `not_started` 或当前唯一的 `in_progress`。同一时间不应该有多个 `in_progress`。

## 4. Verify

快速检查：

```sh
./scripts/check.sh
./scripts/validate-feature-list.sh .
```

当改动触及 build、integration、persistence、deployment 或 public behavior 时，运行完整验证：

```sh
./scripts/verify.sh
```

结果写入 `docs/status.md`。
如果某个功能要标为 `passing`，验证证据也要写回 `feature_list.json`。

不同项目的 verify 重点不同：

- 前端：typecheck、unit/component test、build、关键页面 smoke test。
- 后端：unit/integration test、contract check、migration check、permission regression、health check。
- 全栈：API contract、seed data、end-to-end critical path、auth session 和 app startup。

具体 sensor 选择见 `docs/sensors.md`。

## 5. Review

使用 `prompts/review-diff.md` 或 `skills/review-diff`。

重点看：

- correctness bugs
- missing tests
- architecture boundary violations
- stale docs
- unsafe operations
- over-engineering

当 diff 变大、测试缺口明显、架构边界变复杂，或者验证覆盖不足时，使用 `prompts/dispatch-review.md` 分发 specialist review。

specialist agent 的默认职责不是继续实现，而是制造 backpressure：

- Reviewer Agent 找 correctness 和 stale docs。
- Test Agent 找 missing tests 和 error paths。
- Architect Agent 找 boundary risks。
- Sensor Agent 找 verification gaps。

## 6. Ratchet

如果错误重复出现，或者单次错误影响很大，使用 `prompts/solidify-mistake.md` 或 `skills/solidify-mistake`。

选择最小但有效的 guardrail，不要一上来造重系统。

如果错误暴露的是“项目缺少 sensor”，使用 `prompts/design-sensors.md` 设计 sensor matrix，再决定要更新 docs、scripts、tests 还是 CI。

## 7. Clean State

交接前运行：

```sh
./scripts/clean-state.sh
```

干净状态不只是测试通过，还包括：

- `feature_list.json` 没有多个 `in_progress`，没有缺 evidence 的假 `passing`。
- 快速检查能跑。
- 没有常见临时文件残留。
- `docs/status.md` 和下一步动作足够让新 session 接手。

## 8. Handoff

结束 session 前更新 `docs/status.md`：

- current state
- active feature
- changed files
- commands run
- known risks
- next recommended action

未来 session 不应该依赖隐藏聊天记录。
