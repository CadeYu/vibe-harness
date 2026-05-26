# Tiny Python CLI Example

这是一个真正可跑的 Vibe Harness example。

它实现一条很小的 issue tracker slice：

```text
create project -> create issue -> list issues -> close issue
```

## Run

```sh
./scripts/check.sh
./scripts/verify.sh
```

## Harness Artifacts

- `AGENTS.md`
- `docs/product.md`
- `docs/architecture.md`
- `docs/status.md`
- `docs/mistake-log.md`
- `docs/plans/active.md`
- `scripts/check.sh`
- `scripts/verify.sh`

## Ratchet Example

`test_closing_missing_issue_fails` 是一个 mistake ratchet：它防止 agent 忘记 missing issue 的失败路径。

