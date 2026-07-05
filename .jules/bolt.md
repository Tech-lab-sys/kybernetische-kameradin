## 2026-07-05 - n8n Execution Data Storage Optimization
**Learning:** Saving n8n execution data for successful runs (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: all`) causes significant PostgreSQL database I/O and disk usage bottlenecks on resource-constrained edge devices like the Raspberry Pi 5.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in n8n deployments on edge devices to prevent unnecessary database writes and save storage.
