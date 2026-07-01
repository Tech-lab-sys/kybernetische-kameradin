## 2024-10-24 - Disable n8n Success Execution Saving
**Learning:** Saving execution data for successful n8n runs unnecessarily consumes PostgreSQL database I/O and disk usage on constrained environments like Raspberry Pi 5, leading to performance bottlenecks.
**Action:** Always configure `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in n8n deployments to minimize DB overhead unless explicitly required for debugging.
