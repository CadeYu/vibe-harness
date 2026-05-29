# 错误固化

Mistake ratchet 的目标：把 agent failure 转成项目护栏。

不是只修当前 bug，而是追问：

> 哪个 repo artifact 本来可以阻止它，或者更早暴露它？

## 错误映射

| 错误类型 | 护栏 |
| --- | --- |
| 需求理解错误 | 更新 product docs 或 active plan。 |
| 架构边界被穿透 | 更新 architecture docs 或新增 ADR。 |
| 漏掉边界条件 | 添加 test。 |
| 跳过验证 | 更新 check 或 verify script。 |
| 重复坏模式 | 添加 lint、script check、prompt rule 或 skill rule。 |
| 尝试不安全操作 | 添加 safety rule 和 command guard。 |
| 上下文过期 | 更新 status 和 handoff process。 |

## 护栏优先级

优先选择最轻但有效的护栏：

1. Documentation rule
2. Test case
3. Prompt update
4. Script check
5. Lint rule
6. ADR update
7. Skill update

## 示例

失败：

```text
The agent changed persistence code to fix a UI display bug.
```

根因：

```text
The architecture boundary did not clearly say where display formatting belongs.
```

护栏：

```text
Update docs/architecture.md: display formatting belongs in the interface layer unless it is a domain invariant.
```

后续动作：

```text
Review the diff and add a test for the formatting behavior at the interface boundary.
```

## 何时自动化

第一次低影响错误可以先记录。第二次类似错误，就应该固化成 guardrail。

高影响错误要立刻固化。
