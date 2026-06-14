## 2024-06-14 - n8n Execution Logging I/O Bottleneck
**Learning:** Saving execution data for all successful runs in n8n (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: all`) causes significant PostgreSQL database I/O and disk usage. This becomes a major performance bottleneck, especially on constrained hardware like a Raspberry Pi 5.
**Action:** Set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in the `docker-compose.yml` to minimize database I/O, optimize performance, and avoid unneeded writes for successful executions. This also enhances security by not storing potentially sensitive execution data.
