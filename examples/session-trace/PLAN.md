# 计划

## 当前 Slice

为一个 issue tracker CLI 增加 `list` 行为，能够显示已有 issues。

## 验收标准

- 没有 issues 时输出空列表提示。
- 有 issues 时按创建顺序输出 id 和 title。
- domain test 覆盖空列表和非空列表。
- `./scripts/check.sh` 通过。

## 文件

- `src/tiny_issues/core.py`
- `src/tiny_issues/cli.py`
- `tests/test_core.py`
- `docs/status.md`

## 非目标

- 不增加持久化。
- 不增加复杂过滤。
- 不设计交互式 UI。
