## 2025-03-05 - Insecure Docker Port Binding
**Vulnerability:** Port 5678 for n8n was bound to all interfaces (`5678:5678`) instead of localhost, allowing direct external exposure bypassing the Cloudflare tunnel.
**Learning:** Docker bypasses UFW/iptables by default. Binding to all interfaces exposes internal services directly to the internet if the machine has a public IP.
**Prevention:** Always bind container ports strictly to localhost (e.g., `127.0.0.1:5678:5678`) when services are intended to be accessed exclusively via a local reverse proxy or tunnel like Cloudflare.

## 2025-03-05 - Sensitive Execution Data Storage
**Vulnerability:** n8n execution data for successful runs was set to `all`, which persists sensitive execution data like PII and secrets to the PostgreSQL database.
**Learning:** Storing all execution data by default violates the principle of least privilege and data minimization, persisting secrets that only need to exist during runtime.
**Prevention:** Configure n8n to drop execution data on success (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: none`) to ensure sensitive information does not persist longer than necessary.
