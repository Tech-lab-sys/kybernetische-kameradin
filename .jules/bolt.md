## 2024-06-06 - [PostgreSQL I/O Optimization on Raspberry Pi]
**Learning:** Default n8n configuration logs all executions to the PostgreSQL database (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: all`). On resource-constrained devices like the Raspberry Pi 5 using SD cards or basic SSDs, this causes significant unnecessary I/O overhead and database bloat for successful, routine workflow executions.
**Action:** Set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in the docker-compose environment to minimize DB writes and preserve disk lifecycle, relying on error logging (`EXECUTIONS_DATA_SAVE_ON_ERROR: all`) for debugging.

## 2024-06-06 - [Local Service Exposure via Cloudflared]
**Learning:** Services intended to be routed through a Cloudflare tunnel were previously bound to all interfaces (`"5678:5678"`). This exposes the service directly on the host's network, bypassing the intended tunnel security if the host is reachable.
**Action:** Always bind container ports strictly to localhost (`"127.0.0.1:5678:5678"`) when access should only occur via an accompanying reverse proxy or tunnel running on the same network/host.
