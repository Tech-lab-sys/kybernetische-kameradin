## 2024-06-26 - n8n Execution Data Optimization on Raspberry Pi
**Learning:** Saving execution data for successful n8n runs causes significant PostgreSQL I/O overhead and consumes unnecessary disk space on constrained edge devices like the Raspberry Pi 5.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in n8n's docker-compose.yml configuration to minimize database I/O and improve overall performance.
