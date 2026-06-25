## 2026-06-25 - Optimizing n8n execution data storage on resource-constrained devices
**Learning:** Saving execution data on success causes significant PostgreSQL database I/O and disk usage overhead, particularly on resource-constrained devices like Raspberry Pi 5.
**Action:** Set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in n8n's environment configuration to minimize disk writes and optimize database performance.
