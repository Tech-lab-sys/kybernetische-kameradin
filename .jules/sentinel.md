## 2024-05-28 - Prevent External Port Exposure
**Vulnerability:** n8n container port 5678 was bound to 0.0.0.0 (default), exposing the service directly to the external network bypassing the intended Cloudflare tunnel access.
**Learning:** Docker compose ports bind to all interfaces by default.
**Prevention:** Always bind container ports intended for local-only or tunnel-only access explicitly to 127.0.0.1 in docker-compose.yml.
