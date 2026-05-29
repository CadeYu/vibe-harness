# Sensors

Sensor 是 harness 里的反馈器。它的作用不是证明 agent 很聪明，而是尽早暴露代码、文档、协议或运行时状态中的错误。

一个好的 sensor 应该具备三点：

- 容易运行。
- 失败信息足够具体。
- 能影响下一步行动。

## 通用 Sensor 分层

| 层级 | 常见 Sensor | 主要暴露的问题 |
| --- | --- | --- |
| Build | compile、typecheck、format、lint | 语法、类型、风格和静态错误。 |
| Behavior | unit test、integration test、snapshot test | 业务行为和边界条件错误。 |
| Contract | OpenAPI diff、protobuf compatibility、consumer test | 接口破坏和调用方不兼容。 |
| Data | migration check、schema drift check、fixture check | 数据结构、迁移和持久化风险。 |
| Runtime | health check、smoke test、timeout check | 启动、配置、依赖和运行路径问题。 |
| Security | secret scan、dependency audit、permission regression | 凭证泄漏、依赖漏洞和权限回退。 |
| Process | diff review prompt、status check、doc consistency | 未验证完成、上下文漂移和文档失真。 |

## 后端项目

后端 harness 更应该关注 protocol、data、permission、runtime invariant，而不是只跑 lint。

```sh
# Go
go test ./...
go test -race ./...
go vet ./...

# Java
./gradlew test
./gradlew check
./gradlew flywayValidate

# Python
pytest
ruff check .
mypy .
alembic upgrade head

# Node backend
pnpm test
pnpm typecheck
pnpm lint
```

后端常见 mistake 到 sensor 的映射：

| 错误 | Sensor |
| --- | --- |
| API response shape 被改坏 | contract test 或 OpenAPI diff。 |
| 忘记数据库迁移 | migration check。 |
| 权限判断漏掉 | permission regression test。 |
| SQL overfetching 或 missing index | query review 或 integration test。 |
| 并发状态不安全 | race test 或 stress test。 |
| 配置缺失导致服务无法启动 | startup smoke test。 |
| 错误处理吞掉 root cause | error-path unit test。 |

## 前端项目

前端 harness 需要关注 user-visible behavior 和状态流，不只是 lint。

```sh
pnpm typecheck
pnpm lint
pnpm test
pnpm build
```

常见 sensor：

- component tests 覆盖交互和状态变化。
- accessibility checks 覆盖键盘、label 和语义结构。
- visual review 覆盖布局破裂、遮挡和响应式问题。
- route smoke test 覆盖关键页面能打开。

## 全栈项目

全栈项目最容易出现“前后端各自正确，合起来错”的问题，所以要加跨边界 sensor：

- API contract check。
- seed data smoke test。
- end-to-end create/list/update flow。
- auth session smoke test。
- migration + app startup check。

一个轻量全栈 `scripts/verify.sh` 可以只证明最关键路径：

```sh
#!/usr/bin/env sh
set -eu

./scripts/check.sh
docker compose up -d db
pnpm db:migrate
pnpm build
pnpm test:e2e -- --grep "critical path"
```

## Sensor 选择规则

不要把所有检查都塞进 `check.sh`。推荐分层：

- `scripts/check.sh`：一分钟内完成，适合每次 slice 后运行。
- `scripts/verify.sh`：更完整，适合公共行为、数据库、部署、集成路径改变时运行。
- CI：可以更慢，负责跨平台、完整矩阵和安全扫描。

## Review prompt 也是 sensor

`prompts/review-diff.md` 不是替代测试，而是补测试看不到的问题：

- 架构边界是否被破坏。
- 是否过度设计。
- 是否忘记更新状态文档。
- 是否存在“没有证据的完成声明”。

在 vibe coding 里，sensor 的价值不是让流程变慢，而是让速度有刹车、有仪表盘、有复盘能力。
