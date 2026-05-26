# Mistake Ratchet

Mistake ratchet 的目标：把 agent failure 转成项目护栏。

不是只修当前 bug，而是追问：

> 哪个 repo artifact 本来可以阻止它，或者更早暴露它？

## Mistake Map

| Mistake | Guardrail |
| --- | --- |
| Requirement misunderstood | 更新 product docs 或 active plan。 |
| Architecture boundary crossed | 更新 architecture docs 或新增 ADR。 |
| Edge case missed | 添加 test。 |
| Verification skipped | 更新 check 或 verify script。 |
| Repeated bad pattern | 添加 lint、script check、prompt rule 或 skill rule。 |
| Unsafe operation attempted | 添加 safety rule 和 command guard。 |
| Context went stale | 更新 status 和 handoff process。 |

## Guardrail Order

优先选择最轻但有效的护栏：

1. Documentation rule
2. Test case
3. Prompt update
4. Script check
5. Lint rule
6. ADR update
7. Skill update

## Example

Failure:

```text
The agent changed persistence code to fix a UI display bug.
```

Root cause:

```text
The architecture boundary did not clearly say where display formatting belongs.
```

Guardrail:

```text
Update docs/architecture.md: display formatting belongs in the interface layer unless it is a domain invariant.
```

Follow-up:

```text
Review the diff and add a test for the formatting behavior at the interface boundary.
```

## When to Automate

第一次低影响错误可以先记录。第二次类似错误，就应该固化成 guardrail。

高影响错误要立刻固化。

