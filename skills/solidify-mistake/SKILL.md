---
name: solidify-mistake
description: Use when an agent failure repeats or reveals a high-signal gap that should become a durable guardrail.
---

# Solidify Mistake

把 agent failure 转成最小 durable guardrail。

## 触发时机

以下情况使用这个 skill：

- the same mistake happens twice
- a single mistake has high impact
- an agent misunderstands a requirement
- an agent violates architecture boundaries
- verification was skipped or falsely claimed
- stale context caused wrong work

## 必读材料

- `docs/mistake-log.md`
- `docs/product.md`
- `docs/architecture.md`
- `docs/status.md`
- relevant tests, scripts, prompts, or skills

## 流程

1. 描述 what happened。
2. 描述 expected behavior。
3. 识别 root cause。
4. 分类 failure。
5. 选择能 prevent 或 expose recurrence 的最小 guardrail。
6. 更新相关 artifact。
7. 在 `docs/mistake-log.md` 添加 entry。
8. 定义 follow-up verification。

## 失败分类

- requirement misunderstanding
- architecture boundary violation
- missing edge case
- missing verification
- repeated bad pattern
- unsafe operation
- stale context

## 护栏优先级

选择最轻但有效的 guardrail：

1. Documentation rule
2. Test case
3. Prompt update
4. Script check
5. Lint rule
6. ADR update
7. Skill update

## 产出

- Failure classification。
- Root cause。
- Guardrail added。
- Mistake log entry。
- Verification step。

## 边界

- 不要为每个第一次出现的低影响错误添加 automation。
- 如果轻量 guardrail 已经有效，不要选择更重的 guardrail。
- 不要只把 mistake 留在 chat history。
