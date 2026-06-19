# 当前计划

## 当前目标

把 Vibe Harness 从文档框架升级为可执行的 harness starter。

## 当前 Slice

`vh-001`：补齐功能状态、初始化、验证、干净收尾和审计链路。

## 验收标准

- `feature_list.json` 能被 `scripts/validate-feature-list.sh` 校验。
- 安装后的 M 模板能通过 audit M 级要求。
- 根仓库一致性检查通过。
- 根仓库 audit 能达到 L 级。

## 验证命令

```sh
./scripts/check.sh
./scripts/verify.sh
./scripts/audit.sh .
```
