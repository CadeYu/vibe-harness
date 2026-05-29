# 贡献指南

欢迎改进 Vibe Harness。

## 适合的贡献

适合贡献：

- 更清楚的模板。
- 更小、更可靠的验证脚本。
- 更具体的 mistake ratchet 案例。
- 更好的 prompts 或 skills。
- 可运行示例。
- 公开仓库卫生和 CI 改进。

不适合第一阶段贡献：

- 重型 dashboard。
- 云端服务依赖。
- 绑定单一 AI coding 产品的核心流程
- 默认执行 destructive commands

## 开发流程

1. 保持改动小而可审查。
2. 如果改 shell script，先补或更新 `tests/*.sh`。
3. 运行验证：

```sh
sh -n scripts/audit.sh scripts/install.sh templates/base/scripts/check.sh templates/base/scripts/verify.sh
sh -n scripts/check-consistency.sh
sh tests/test_audit.sh
sh tests/test_install.sh
sh tests/test_consistency.sh
```

4. 如果改 example，运行：

```sh
cd examples/tiny-python-cli
./scripts/check.sh
```

## PR 检查清单

- [ ] 我说明了这个改动解决什么问题。
- [ ] 我没有引入真实 credentials 或 private endpoints。
- [ ] 我运行了相关 verification commands。
- [ ] 我更新了 docs、prompts 或 skills 中受影响的部分。
