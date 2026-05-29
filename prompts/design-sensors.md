# 设计 Sensors

当项目缺少验证入口，或者某类错误需要更早暴露时使用。

```text
请为当前项目设计 sensor matrix。

先读取：
- AGENTS.md
- docs/product.md
- docs/architecture.md
- docs/plans/active.md
- docs/status.md
- docs/mistake-log.md
- scripts/check.sh
- scripts/verify.sh
- package/build/test config files

任务：
1. 识别项目类型：frontend、backend、fullstack、CLI、library 或 mixed。
2. 识别最重要的 failure modes。
3. 审查当前 check/verify 是否覆盖这些风险。
4. 设计最小 sensor matrix。
5. 区分 fast checks、full verification 和 CI-only checks。
6. 给出需要更新的具体文件。

输出表格：
- Sensor
- 触发时机
- 命令或检查方式
- 覆盖的风险
- 失败后怎么处理
- 应该放在 check、verify 还是 CI

约束：
- 不要把所有检查塞进 scripts/check.sh。
- 优先使用项目已有工具。
- 不要引入重平台。
- 每个新增 sensor 都必须解释它防止或暴露哪类错误。
```
