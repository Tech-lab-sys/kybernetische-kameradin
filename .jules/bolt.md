## 2026-06-10 - Disable executions data save on success
**Learning:** To optimize performance on the resource-constrained Raspberry Pi 5, n8n execution data for successful runs should be disabled (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in `infra/docker-compose.yml`) to minimize PostgreSQL database I/O and disk usage.
**Action:** Update `infra/docker-compose.yml` to set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` instead of `all`.
