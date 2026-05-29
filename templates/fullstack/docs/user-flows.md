# 用户流程

这个文档用来把 frontend、backend 和 persistence 的 product behavior 串起来。

## 流程模板

### 流程名称

## 用户目标

描述用户想完成什么。

## 步骤

1. 用户从一个已知状态开始。
2. 用户执行一个动作。
3. 系统校验输入。
4. 系统写入或读取数据。
5. UI 展示结果。

## 数据触点

- Request 或 command shape。
- Domain operation。
- Persistence operation。
- Response shape。
- UI state update。

## 失败模式

- Validation failure。
- Authorization failure。
- Network or infrastructure failure。
- Partial completion。

## 验证

- Unit tests 覆盖 domain behavior。
- Integration tests 覆盖 API 和 persistence。
- Browser 或 manual QA 覆盖完整路径。
