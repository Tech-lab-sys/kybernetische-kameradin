## 2024-06-16 - Prevent Direct External Exposure of n8n
**Vulnerability:** The n8n port in `infra/docker-compose.yml` was bound to all interfaces (`"5678:5678"`), meaning it could be accessed directly from the external network if not behind a strict firewall, bypassing the intended Cloudflare tunnel routing.
**Learning:** External access to the project's local services (like n8n) is supposed to be routed through a Cloudflare tunnel. Exposing ports globally circumvents this zero-trust architecture.
**Prevention:** Container ports in docker-compose should be bound explicitly to localhost (e.g., `"127.0.0.1:5678:5678"`) to prevent direct external exposure, enforcing that traffic must go through the tunnel or a local proxy.
