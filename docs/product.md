# 产品上下文

## 目标

Vibe Harness 是一个中文优先的 repo-native vibe coding framework。它帮助开发者在新项目或已有项目中快速建立上下文、范围控制、验证入口、错误固化和会话交接机制。

## 用户

- 准备现场 vibe coding 面试的开发者。
- 想把 AI coding 从临时 prompt 升级为工程流程的独立开发者。
- 想为前端、后端或全栈项目建立轻量 harness 的团队。

## 非目标

- 不替代项目自己的测试框架、构建系统或 CI。
- 不绑定某个 AI coding 产品。
- 不把轻量项目改造成重平台。
- 不要求所有项目一开始使用 L 级模板。

## 核心流程

1. 安装 S/M/L 模板。
2. 运行初始化检查。
3. 从 `feature_list.json` 选择一个 feature。
4. 实现一条 thin vertical slice。
5. 运行检查和审计。
6. 把失败固化成文档、测试、脚本、prompt 或 skill。
7. 结束前运行干净收尾检查并更新状态。

## 验收标准

- 新项目能通过 installer 获得最小可用 harness。
- M 模板安装后能通过 `scripts/audit.sh` 的 M 级判断。
- 根仓库能通过 `scripts/check.sh` 和 `scripts/verify.sh`。
- 文档、prompts、skills 和模板保持中文为主，并通过一致性检查。
