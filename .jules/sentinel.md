## 2024-06-27 - [Exposed Service Ports and Sensitive Data Logging]
**Vulnerability:** n8n container port was bound to all interfaces (0.0.0.0:5678) bypassing the Cloudflare tunnel, and execution data for successful runs was being logged, which could expose PII and secrets.
**Learning:** Default Docker port bindings expose services externally unless bound to localhost. Default n8n logging saves all data, including sensitive variables.
**Prevention:** Always bind container ports to `127.0.0.1` when using a reverse proxy/tunnel. Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in n8n configurations to avoid saving sensitive information.
