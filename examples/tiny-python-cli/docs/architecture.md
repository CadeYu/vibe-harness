# 架构上下文

## 系统形态

`tiny_issues.core` 拥有 domain behavior。`tiny_issues.cli` 只负责展示一条 happy path。

## 模块边界

| 模块 | 职责 | 禁止事项 |
| --- | --- | --- |
| `core.py` | 拥有 project 和 issue 行为。 | 打印 CLI 输出。 |
| `cli.py` | 展示一个很小的 demo flow。 | 拥有 domain rules。 |

## 测试策略

`tests/test_core.py` 覆盖 domain behavior 和 missing issue failure。
