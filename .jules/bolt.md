## 2026-06-27 - Disable n8n Execution Data Save on Success
**Learning:** Saving execution data for successful runs in n8n causes unnecessary PostgreSQL I/O and disk usage on Raspberry Pi 5.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in docker-compose.yml to optimize performance.