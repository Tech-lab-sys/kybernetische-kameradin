## 2026-06-24 - Disable n8n execution data save on success
**Learning:** Saving execution data for successful n8n runs unnecessarily increases PostgreSQL database I/O and disk usage on the Raspberry Pi 5.
**Action:** Always set EXECUTIONS_DATA_SAVE_ON_SUCCESS: none in docker-compose.yml to optimize performance unless specifically debugging.
