## 2026-07-08 - n8n Execution Data Persistence on Raspberry Pi 5
**Learning:** Saving n8n execution data on every successful run (`EXECUTIONS_DATA_SAVE_ON_SUCCESS=all`) creates a severe performance bottleneck due to excessive PostgreSQL I/O and disk usage on resource-constrained devices like the Raspberry Pi 5.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS=none` in n8n deployments on Raspberry Pi to optimize performance and prevent unnecessary database writes.
