# 错误固化日志

这个文件记录 Vibe Harness 自身的框架错误，以及对应的最小护栏。

| 日期 | 错误 | 固化方式 | 证据 |
| --- | --- | --- | --- |
| 2026-06-19 | 模板新增脚本后，audit 测试没有给 validator 执行权限，导致 M 模板被降级。 | 更新 `tests/test_audit.sh`，并确保新增脚本可执行。 | `sh tests/test_audit.sh` |
| 2026-06-19 | 根仓库文档建议直接执行 `./scripts/audit.sh`，但脚本缺少执行权限。 | 给根脚本补执行权限，并把语法检查纳入验证。 | `./scripts/audit.sh .` |
