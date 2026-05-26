# Examples

Examples 用来展示 framework loop 如何在小项目里落地。

## Tiny App

见 `examples/tiny-app/README.md`。

这个例子展示：

- product framing
- one vertical slice
- verification
- review
- mistake ratchet
- handoff

## Tiny Python CLI

见 `examples/tiny-python-cli/README.md`。

这是一个真正可运行的 example：

```sh
cd examples/tiny-python-cli
./scripts/check.sh
./scripts/verify.sh
```

它使用 Python standard library 和 `unittest`，不需要安装第三方依赖。

## Adding More Examples

例子要保持小。优先写能展示决策和 artifacts 的 walkthrough，而不是大型 demo app。

适合后续添加的例子：

- tiny frontend app
- tiny backend API
- tiny fullstack issue tracker
- CLI utility with tests
