# 错误记录

## 示例记录

### 日期

2026-05-25

### 发生了什么

Agent 可能忘记处理 close missing issue 的失败路径。

### 护栏

`tests/test_core.py` 包含 `test_closing_missing_issue_fails`。

### 后续验证

运行 `./scripts/check.sh`。
