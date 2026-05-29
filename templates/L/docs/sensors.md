# Sensors

这个文件记录项目的 sensor matrix。每个 sensor 都应该有触发时机、命令或检查方式、覆盖风险和失败处理方式。

## Sensor Matrix

| Sensor | 触发时机 | 命令或方式 | 覆盖风险 | 失败后处理 | 层级 |
| --- | --- | --- | --- | --- | --- |
| Fast check | 每条 slice 后。 | `./scripts/check.sh` | 基础语法、lint、unit tests。 | 修复后重跑。 | check |
| Full verify | 公共行为、集成、持久化或部署相关改动。 | `./scripts/verify.sh` | build、integration、runtime smoke。 | 修复、更新 status。 | verify |
| Diff review | claim completion 前。 | `prompts/dispatch-review.md` | correctness、missing tests、stale docs。 | 修 findings。 | process |
| Mistake ratchet | 重复错误或高影响错误。 | `prompts/solidify-mistake.md` | 同类错误复发。 | 更新 docs、tests、scripts 或 skills。 | ratchet |

## 项目定制

按项目类型补充：

- Backend：contract check、migration check、permission regression、health check。
- Frontend：typecheck、component tests、browser smoke、accessibility check。
- Fullstack：API contract、seed data、auth session、critical path e2e。
- CLI：golden output、error-path tests、exit code checks。

## 规则

- `scripts/check.sh` 应该快速。
- `scripts/verify.sh` 可以更完整。
- 慢检查放 CI。
- 新增 sensor 必须说明覆盖哪类风险。
