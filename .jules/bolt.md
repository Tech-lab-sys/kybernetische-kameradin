## 2024-06-29 - Disable n8n execution data for successful runs
**Learning:** Saving execution data for all successful runs causes unnecessary PostgreSQL I/O and high disk usage, severely degrading performance on resource-constrained devices like the Raspberry Pi 5.
**Action:** Set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in n8n's docker-compose configuration to avoid performance bottlenecks.
