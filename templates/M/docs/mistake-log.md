# 错误记录

把 agent failures 转成 durable guardrails。

## 护栏映射

| 错误类型 | 护栏 |
| --- | --- |
| 需求理解错误 | 更新 product docs 或 active plan。 |
| 架构边界违规 | 更新 architecture docs 或 ADR。 |
| 漏掉边界条件 | 添加 test。 |
| 缺少验证 | 更新 check 或 verify script。 |
| 重复坏模式 | 添加 lint、script、prompt 或 skill rule。 |

## 记录模板

### 日期

YYYY-MM-DD

### 发生了什么

### 根因

### 护栏

### 后续验证
