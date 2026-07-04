## 2026-07-04 - n8n Execution Data Optimization
**Learning:** Saving execution data for successful n8n runs (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: all`) causes significant PostgreSQL database I/O and disk usage bottlenecks on the Raspberry Pi 5.
**Action:** Always ensure `EXECUTIONS_DATA_SAVE_ON_SUCCESS` is set to `none` in `infra/docker-compose.yml` to optimize performance and minimize disk writes.
