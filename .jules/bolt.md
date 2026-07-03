## 2026-07-03 - Optimize PostgreSQL I/O via n8n Execution Logging
**Learning:** Logging all successful n8n executions causes significant PostgreSQL database I/O bottlenecks and disk usage issues on resource-constrained devices like the Raspberry Pi 5.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in n8n deployments to reduce database I/O overhead and prevent excessive disk usage.