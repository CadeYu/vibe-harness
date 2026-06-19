# 0001. 框架自身使用 Harness

## 决策

Vibe Harness 自身也使用项目态 harness 文件：`feature_list.json`、`docs/status.md`、`docs/plans/active.md`、`scripts/check.sh` 和 `scripts/verify.sh`。

## 原因

这个仓库不能只教别人做 harness。它需要能通过自己的 audit，让框架质量可验证、可恢复、可交接。

## 影响

- 根仓库 audit 可以作为框架健康度信号。
- 文档、模板和脚本变更需要同步更新状态和功能清单。
- 框架仓库的验证入口与安装后的项目模板保持同构。
