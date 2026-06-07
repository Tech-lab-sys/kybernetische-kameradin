## 2024-05-18 - Minimize n8n DB I/O on Edge Devices
**Learning:** Default n8n settings (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: all`) save execution data for every successful run, causing a massive, unnecessary performance bottleneck on resource-constrained devices like the Raspberry Pi 5 due to excessive PostgreSQL database I/O and disk wear.
**Action:** When deploying n8n or similar orchestration tools on edge hardware, always disable execution logging for successful runs (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: none`) unless strictly needed for debugging. Ensure only errors are logged.
