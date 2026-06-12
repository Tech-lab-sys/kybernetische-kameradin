## 2026-06-12 - Disable execution data saving on success
**Learning:** Saving execution data on success for n8n workflows causes significant database I/O and disk usage, which is a performance bottleneck on the Raspberry Pi 5.
**Action:** Set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in the docker-compose configuration to avoid writing unnecessary data to PostgreSQL for successful runs.
