# Ratchet 案例

## 案例 1：遗漏边界条件

失败：

```text
Agent implemented the happy path but missed empty input.
```

护栏：

```text
Add a regression test for empty input.
```

## 案例 2：架构边界违规

失败：

```text
Agent placed display formatting in persistence code.
```

护栏：

```text
Update docs/architecture.md and add review checklist coverage.
```

## 案例 3：跳过验证

失败：

```text
Agent claimed completion without command evidence.
```

护栏：

```text
Make scripts/check.sh the required completion gate.
```
