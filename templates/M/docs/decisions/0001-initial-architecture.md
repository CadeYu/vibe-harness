# 0001 初始架构

## 状态

Accepted

## 背景

项目需要一个简单且明确的初始架构，支持 AI-assisted iteration。

## 决策

使用清晰 module boundaries，并通过 project-local scripts 验证改动。

## 后果

- Agent 有稳定上下文。
- Boundary violations 更容易 review。
- 后续复杂决策需要新增 ADR。

