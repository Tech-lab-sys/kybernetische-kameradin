## 2024-07-25 - n8n Execution Data Optimization on Raspberry Pi 5
**Learning:** Saving execution data on success (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: all`) causes significant PostgreSQL database I/O and disk usage bottlenecks on resource-constrained devices like the Raspberry Pi 5.
**Action:** Ensure `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` is maintained in `docker-compose.yml` to minimize database I/O and optimize workflow performance.
