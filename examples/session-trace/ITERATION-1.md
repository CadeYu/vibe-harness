# 第 1 轮迭代

## 改动

增加 `IssueStore.list_issues()`，并让 CLI 调用它输出 issues。

## 检查

```sh
./scripts/check.sh
```

Result:

```text
failed
```

## 失败

测试发现空列表时 CLI 没有稳定输出，导致用户无法区分“命令失败”和“确实没有数据”。

## 修复

把空列表行为固化为 domain rule，并新增 test 覆盖：

```text
When there are no issues, list returns an empty collection and CLI prints a stable empty-state message.
```

## Ratchet 候选

如果 CLI 输出格式再次漂移，把输出 contract 写入 `docs/product.md` 或增加 snapshot-style test。
