## 2026-07-08 - Port Binding Exposure
**Vulnerability:** The n8n service in `docker-compose.yml` was binding to all network interfaces (`5678:5678`), exposing the service directly to the network instead of routing exclusively through the Cloudflare tunnel.
**Learning:** Container ports mapped without a specific IP address bind to `0.0.0.0` by default, bypassing intended network isolation mechanisms like Cloudflared.
**Prevention:** Always bind internal-only container ports to localhost (`127.0.0.1:PORT:PORT`) when relying on a tunnel or reverse proxy for external access.
