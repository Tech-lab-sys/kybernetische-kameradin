## 2026-07-02 - Unrestricted Port Binding in Docker Compose

**Vulnerability:** n8n container port 5678 was bound to all interfaces (0.0.0.0) instead of being restricted to localhost.
**Learning:** Even when using a reverse proxy or Cloudflare tunnel, binding to all interfaces can expose the service directly if the host firewall is not properly configured.
**Prevention:** Always bind container ports explicitly to 127.0.0.1 (e.g., `127.0.0.1:5678:5678`) when they are meant to be accessed only via a local reverse proxy or tunnel.