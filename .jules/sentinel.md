## 2026-07-01 - Prevent direct port exposure in Docker Compose
**Vulnerability:** The n8n port was bound to `5678:5678` in `docker-compose.yml`, bypassing the Cloudflare tunnel and allowing direct external access to the service.
**Learning:** Docker manipulates iptables to expose ports externally by default unless explicitly bound to localhost, even when a secure tunnel is intended as the only entry point.
**Prevention:** Always bind ports to localhost (`127.0.0.1:5678:5678`) when the service is intended to be accessed exclusively via a secure tunnel or reverse proxy.
