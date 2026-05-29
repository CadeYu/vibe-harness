# 仓库指令

这个仓库定义 Vibe Harness：一个 repo-native 的 AI-assisted development framework。

## 项目规则

- 所有 artifacts 都应该能复制到普通软件项目里使用。
- 优先写具体模板，不写空泛方法论。
- 不绑定某一个 AI coding 产品。
- `prompts/` 保持短、清楚、可直接粘贴。
- `skills/` 和 `prompts/` 要分工明确：prompt 是一次性指令，skill 是可复用操作规程。
- `scripts/check.sh` 和 `scripts/verify.sh` 是一等公民，不是附属品。

## 文档风格

- 中文为主，保留英文技术锚点。
- 文件名、命令、skill name、commit message 示例保持 English。
- 解释每个 artifact 为什么存在、什么时候用。
- 避免不可执行的流程空话。
- 示例要小到能在一次阅读里理解。

## 安全规则

- 不把 destructive git commands 作为默认工作流。
- 不包含真实 credentials、tokens 或私有 endpoints。
- 脚本不要删除文件、重建数据库或执行不可逆操作。
- 检查脚本应该 fail loudly，并且容易按项目定制。

## 验证

完成前运行：

```sh
sh -n templates/base/scripts/check.sh
sh -n templates/base/scripts/verify.sh
sh -n scripts/check-consistency.sh
sh tests/test_consistency.sh
```

扫描公开文档里的未完成标记：

```sh
rg -n "TB[D]|TO[D]O|FIXM[E]|placeholde[r]|coming soo[n]" README.md AGENTS.md templates prompts skills docs/*.md examples
```

## 完成标准

一个改动完成需要满足：

- 被编辑 artifact 有单一清晰职责
- 相关 docs、prompts、skills 保持一致
- shell scripts 通过语法检查
- framework loop 仍然清晰可用
- final response 给出简洁 English commit message
