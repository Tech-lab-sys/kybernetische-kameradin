## 2026-07-04 - [Bind n8n port to localhost]
**Vulnerability:** [n8n port 5678 in docker-compose.yml was bound to all interfaces (0.0.0.0) instead of localhost]
**Learning:** [Since external access is routed through a Cloudflare tunnel, binding to all interfaces risks bypassing the tunnel and exposing the service directly]
**Prevention:** [Always bind container ports to 127.0.0.1 in docker-compose.yml when using a reverse proxy or tunnel for external access]