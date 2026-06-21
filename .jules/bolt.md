## 2026-06-21 - n8n Execution Data Database I/O Bottleneck
**Learning:** Saving successful execution data in n8n (`EXECUTIONS_DATA_SAVE_ON_SUCCESS=all`) creates a significant PostgreSQL database I/O bottleneck and unnecessary disk usage, particularly constraining performance on lightweight edge hardware like a Raspberry Pi 5.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in the n8n environment configuration to prevent this overhead, ensuring only manual executions and errors are stored for debugging.
