## 2026-06-09 - [n8n Performance on RPi5]
**Learning:** Saving execution data on successful runs in n8n (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: all`) causes high database I/O and disk usage. This is a significant performance bottleneck on resource-constrained devices like the Raspberry Pi 5.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in Docker Compose configurations for edge-computing / Raspberry Pi deployments to minimize I/O overhead and save disk space.
