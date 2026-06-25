## 2026-06-25 - Prevent External Exposure and Data Leaks
**Vulnerability:** Port 5678 was bound to 0.0.0.0, allowing potential direct external access bypassing the Cloudflare tunnel. Additionally, successful workflow executions were saving all data, potentially leaking PII and secrets in the database.
**Learning:** Services intended to be accessed exclusively via Cloudflare tunnels must bind to localhost to prevent bypass. Execution data should be minimized to avoid persistent storage of sensitive data.
**Prevention:** Always bind exposed ports to 127.0.0.1 (e.g., "127.0.0.1:5678:5678") when using a reverse proxy/tunnel, and set EXECUTIONS_DATA_SAVE_ON_SUCCESS to none.
