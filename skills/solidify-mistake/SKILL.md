---
name: solidify-mistake
description: 当 agent 失败重复出现，或暴露需要转成 durable guardrail 的高信号缺口时使用。
---

# Solidify Mistake（固化错误）

把 agent 失败转成最小 durable guardrail。

## 触发时机

以下情况使用这个 skill：

- 同类 mistake 出现第二次。
- 单次 mistake 影响很高。
- agent 误解需求。
- agent 违反架构边界。
- 验证被跳过或被错误声称完成。
- 过期上下文导致错误工作。

## 必读材料

- `docs/mistake-log.md`
- `docs/product.md`
- `docs/architecture.md`
- `docs/status.md`
- 相关 tests、scripts、prompts 或 skills。

## 流程

1. 描述发生了什么。
2. 描述预期行为。
3. 识别 root cause。
4. 分类失败。
5. 选择能防止复发或暴露复发的最小 guardrail。
6. 更新相关 artifact。
7. 在 `docs/mistake-log.md` 添加条目。
8. 定义后续验证。

## 失败分类

- 需求理解错误。
- 架构边界违规。
- 漏掉边界条件。
- 缺少验证。
- 重复坏模式。
- 不安全操作。
- 上下文过期。

## 护栏优先级

选择最轻但有效的 guardrail：

1. 文档规则。
2. Test case。
3. Prompt update。
4. Script check。
5. Lint rule。
6. ADR update。
7. Skill update。

## 产出

- 失败分类。
- 根因。
- 已添加的 guardrail。
- Mistake log 条目。
- 验证步骤。

## 边界

- 不要为每个第一次出现的低影响错误添加自动化。
- 如果轻量 guardrail 已经有效，不要选择更重的 guardrail。
- 不要只把 mistake 留在聊天历史里。
