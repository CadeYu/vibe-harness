# Workflow

日常开发使用这条主循环：

```text
Frame -> Slice -> Verify -> Review -> Ratchet -> Handoff
```

## 1. Frame

编码前先更新：

- `docs/product.md`
- `docs/architecture.md`
- `docs/plans/active.md`

输出应该是一条很小的 vertical slice，并且有可观察的 acceptance criteria。

新项目可以先安装默认 M 级 harness：

```sh
./scripts/install.sh /path/to/project --size M
```

已有项目可以先审计：

```sh
./scripts/audit.sh /path/to/project
```

## 2. Slice

只实现 active slice。

好的 slice 是一条很细但完整的路径：

```text
UI or API -> application behavior -> domain rule -> persistence or state -> verification
```

避免“build the dashboard”这种宽泛任务。优先做“create and list one item”这种能证明路径的任务。

## 3. Verify

快速检查：

```sh
./scripts/check.sh
```

当改动触及 build、integration、persistence、deployment 或 public behavior 时，运行完整验证：

```sh
./scripts/verify.sh
```

结果写入 `docs/status.md`。

## 4. Review

使用 `prompts/review-diff.md` 或 `skills/review-diff`。

重点看：

- correctness bugs
- missing tests
- architecture boundary violations
- stale docs
- unsafe operations
- over-engineering

## 5. Ratchet

如果错误重复出现，或者单次错误影响很大，使用 `prompts/solidify-mistake.md` 或 `skills/solidify-mistake`。

选择最小但有效的 guardrail，不要一上来造重系统。

## 6. Handoff

结束 session 前更新 `docs/status.md`：

- current state
- changed files
- commands run
- known risks
- next recommended action

未来 session 不应该依赖隐藏聊天记录。
