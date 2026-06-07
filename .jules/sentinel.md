## 2024-06-07 - [Architecture] Direct Port Exposure Bypass
**Vulnerability:** The n8n docker-compose service was exposing port 5678 globally (`- "5678:5678"`), meaning it was bound to `0.0.0.0:5678`. This bypassed the intended Cloudflare tunnel architecture and exposed the n8n instance directly to the internet via the host's public IP.
**Learning:** Container ports must be explicitly bound to `127.0.0.1` when an external reverse proxy or tunnel (like cloudflared) is intended to be the sole entrypoint. Docker bypasses ufw/iptables by default.
**Prevention:** Always use `- "127.0.0.1:PORT:PORT"` syntax in `docker-compose.yml` for services that should only be accessible locally or via a reverse proxy/tunnel.
