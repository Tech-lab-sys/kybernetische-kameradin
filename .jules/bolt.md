## 2025-01-20 - n8n Execution Logging Overhead
**Learning:** Saving execution data for successful n8n runs creates significant unnecessary PostgreSQL database I/O and disk usage. This is particularly problematic on constrained devices like the Raspberry Pi 5 where disk performance and I/O limits can become a bottleneck for overall system responsiveness.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in the n8n environment configuration for production workloads unless successful execution history is explicitly required.
