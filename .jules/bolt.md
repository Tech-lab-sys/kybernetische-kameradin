## 2026-06-21 - Disable n8n execution data save
**Learning:** Saving successful execution data in n8n causes unnecessary database I/O bottlenecks on Raspberry Pi 5.
**Action:** Set EXECUTIONS_DATA_SAVE_ON_SUCCESS to 'none' in docker-compose.yml.
