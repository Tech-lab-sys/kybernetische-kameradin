## 2026-06-16 - Disable n8n execution data saving on success
**Learning:** Saving execution data for successful runs creates unnecessary PostgreSQL database I/O and disk usage on the Raspberry Pi 5, leading to performance bottlenecks when handling dozens of parallel workflows.
**Action:** Set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in the n8n Docker Compose environment to skip saving execution data for successful runs, thereby optimizing performance.
