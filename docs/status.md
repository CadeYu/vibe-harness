# 当前状态

## 已验证

- Vibe Harness 已加入 `feature_list.json` 状态机。
- S/M/base 模板包含功能清单校验入口。
- M/base 模板包含初始化和干净收尾脚本。
- `scripts/audit.sh` 输出分层评分和下一步修复建议。
- 根仓库自身通过 audit L 级检查。

## 最近验证

```sh
sh tests/test_audit.sh && sh tests/test_install.sh && sh tests/test_consistency.sh && sh tests/test_feature_list.sh
./scripts/check.sh
./scripts/verify.sh
./scripts/audit.sh .
```

## 当前风险

- L 级模板仍是增量扩展，不应单独当作完整项目模板使用。
- 不同语言项目需要把 `scripts/check.sh` 和 `scripts/verify.sh` 定制为真实命令。

## 下一步

- 根据真实项目使用反馈继续收紧 sensor。
- 为常见前端、后端、全栈项目补更具体的模板。
