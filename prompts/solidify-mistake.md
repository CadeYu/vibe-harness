# Solidify Mistake

当 agent failure 需要变成 durable guardrail 时使用。

```text
Analyze this failure and convert it into the smallest durable guardrail.

Failure:
- What happened:
- Expected behavior:
- Where it happened:
- Whether this has happened before:

Classify the failure:
- requirement misunderstanding
- architecture boundary violation
- missing edge case
- missing verification
- repeated bad pattern
- unsafe operation
- stale context

Choose the smallest guardrail:
- documentation rule
- test case
- lint rule
- script check
- prompt update
- ADR update
- skill update

Rules:
- Do not choose a heavier guardrail when a lighter one prevents recurrence.
- If this is the first low-impact occurrence, log it before adding automation.
- If this is repeated or high-impact, add a concrete guardrail now.

Output:
- Failure classification
- Root cause
- Chosen guardrail
- Exact file to update
- Follow-up verification command or review step
- Suggested entry for docs/mistake-log.md
```
