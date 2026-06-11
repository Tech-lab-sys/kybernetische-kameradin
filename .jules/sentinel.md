
## 2024-05-18 - Insecure Docker Port Binding
**Vulnerability:** The `docker-compose.yml` file originally exposed the `n8n` service via `ports: - "5678:5678"`. In Docker, this defaults to binding `0.0.0.0:5678`, exposing the container directly to the host's external network interfaces. This bypassed the intended security model where all external access should route securely through the Cloudflare tunnel.
**Learning:** Cloudflare tunnels don't automatically restrict other network interfaces. If a Docker port is mapped generally without an IP prefix, it's globally exposed, which undermines the tunnel's security advantages.
**Prevention:** Always explicitly bind Docker ports intended for internal or tunneled routing to `127.0.0.1` (e.g., `- "127.0.0.1:5678:5678"`). Additionally, reduce logging of execution data to minimize the risk of logging sensitive execution details (PII, credentials).
