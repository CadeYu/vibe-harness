# User Flows

这个文档用来把 frontend、backend 和 persistence 的 product behavior 串起来。

## Flow Template

### Flow Name

## User Goal

描述用户想完成什么。

## Steps

1. User starts from a known state。
2. User performs an action。
3. System validates input。
4. System persists or reads data。
5. UI shows the result。

## Data Touchpoints

- Request or command shape
- Domain operation
- Persistence operation
- Response shape
- UI state update

## Failure Modes

- Validation failure
- Authorization failure
- Network or infrastructure failure
- Partial completion

## Verification

- Unit tests for domain behavior
- Integration tests for API and persistence
- Browser or manual QA for the full path

