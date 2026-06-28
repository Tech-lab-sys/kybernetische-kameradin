## 2024-10-24 - n8n Execution Data Storage Optimization on Raspberry Pi 5
**Learning:** Storing execution data for successful runs in n8n (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: all`) causes significant and unnecessary PostgreSQL database I/O and disk space consumption, which acts as a major performance bottleneck on constrained edge devices like the Raspberry Pi 5.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in `docker-compose.yml` for n8n edge deployments to drastically reduce database load and improve overall workflow execution speed.
