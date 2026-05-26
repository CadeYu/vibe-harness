# Mistake Log

这个文件用来把 agent failures 转成 durable project guardrails。

## Rule of Thumb

第一次错误可以先记录。第二次类似错误应该变成 guardrail。

## Guardrail Map

| Mistake Type | Smallest Useful Guardrail |
| --- | --- |
| Requirement misunderstanding | 更新 `docs/product.md` 或 active plan。 |
| Architecture boundary violation | 更新 `docs/architecture.md` 或添加 ADR。 |
| Missing edge case | 添加或更新 test。 |
| Missing verification | 更新 `scripts/check.sh` 或 `scripts/verify.sh`。 |
| Repeated bad pattern | 添加 lint、script check、prompt rule 或 skill rule。 |
| Unsafe operation | 添加 safety rule 和 command guard。 |
| Stale context | 更新 `docs/status.md` 和 handoff process。 |

## Entry Template

### Date

YYYY-MM-DD

### What Happened

描述错误行为或 workflow failure。

### Why It Happened

说明缺失的 context、check、清晰需求或架构边界。

### Expected Behavior

描述本来应该发生什么。

### Guardrail

选择最小 durable guardrail：

- documentation rule
- test case
- lint rule
- script check
- prompt update
- ADR update
- skill update

### Follow-Up Verification

描述用哪个 command、test、review step 或 manual check 证明 guardrail 有效。

