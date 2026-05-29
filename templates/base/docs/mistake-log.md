# 错误记录

这个文件用来把 agent failures 转成 durable project guardrails。

## 基本规则

第一次错误可以先记录。第二次类似错误应该变成 guardrail。

## 护栏映射

| 错误类型 | 最小有效护栏 |
| --- | --- |
| 需求理解错误 | 更新 `docs/product.md` 或 active plan。 |
| 架构边界违规 | 更新 `docs/architecture.md` 或添加 ADR。 |
| 漏掉边界条件 | 添加或更新 test。 |
| 缺少验证 | 更新 `scripts/check.sh` 或 `scripts/verify.sh`。 |
| 重复坏模式 | 添加 lint、script check、prompt rule 或 skill rule。 |
| 不安全操作 | 添加 safety rule 和 command guard。 |
| 上下文过期 | 更新 `docs/status.md` 和 handoff process。 |

## 记录模板

### 日期

YYYY-MM-DD

### 发生了什么

描述错误行为或 workflow failure。

### 为什么发生

说明缺失的 context、check、清晰需求或架构边界。

### 预期行为

描述本来应该发生什么。

### 护栏

选择最小 durable guardrail：

- documentation rule
- test case
- lint rule
- script check
- prompt update
- ADR update
- skill update

### 后续验证

描述用哪个 command、test、review step 或 manual check 证明 guardrail 有效。
