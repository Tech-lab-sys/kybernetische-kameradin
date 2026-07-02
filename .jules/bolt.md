## 2024-07-02 - Disable n8n successful execution data saving
**Learning:** Saving execution data for successful n8n runs causes unnecessary PostgreSQL database I/O and disk usage on the Raspberry Pi 5.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in n8n docker-compose environments to minimize overhead.
