# 0001 Initial Architecture

## Status

Accepted

## Context

项目需要一个初始架构：足够简单，支持快速 AI-assisted iteration；也足够明确，防止 boundary drift。

## Decision

使用职责清晰的小 modules。Domain behavior 不依赖 interface 和 persistence details。项目上下文保存在 versioned documents 中，改动通过 project-local scripts 验证。

## Consequences

- Agents 可以依赖稳定 docs，而不是隐藏聊天上下文。
- Boundary violations 可以对照 `docs/architecture.md` review。
- Verification commands 成为默认 completion gate。
- 随着项目增长，可能需要更多 ADRs。

