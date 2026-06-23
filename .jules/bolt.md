## 2024-06-23 - Disable n8n execution data on success
**Learning:** Saving execution data for successful runs in n8n can become a performance bottleneck on resource-constrained devices like the Raspberry Pi 5, leading to unnecessary PostgreSQL I/O and disk space consumption.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in the `docker-compose.yml` file for n8n deployments unless detailed logging for successful runs is explicitly required for debugging.
