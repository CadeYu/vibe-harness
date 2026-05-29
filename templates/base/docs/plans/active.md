# 当前计划

## 目标

用一句话说明当前任务。

## 范围

### 范围内

- 列出本任务包含的 behavior 或 files。

### 范围外

- 列出不应该顺手改的相邻工作。

## 验收标准

- 每一项都必须 observable and verifiable。

## 实施步骤

1. 对照 `docs/product.md` 和 `docs/architecture.md` frame change。
2. 实现最小 vertical slice。
3. 为变化的行为添加或更新 tests。
4. 运行 `./scripts/check.sh`。
5. Review diff。
6. 更新 `docs/status.md`。

## 验证 Plan

Fast check:

```sh
./scripts/check.sh
```

Full verification:

```sh
./scripts/verify.sh
```

## 备注

记录影响本任务的 constraints、decisions 和 open questions。

