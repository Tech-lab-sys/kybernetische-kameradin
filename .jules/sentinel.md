## 2024-05-18 - Insecure Container Port Binding

**Vulnerability:** The n8n Docker container had its port published globally (`"5678:5678"`) in `docker-compose.yml`, directly exposing it to the host's network and bypassing the intended Cloudflare Tunnel security model.

**Learning:** When using external routing solutions like Cloudflared, publishing container ports without a host IP binding makes them accessible from any interface on the host machine. This undermines the "Zero Trust" model where the tunnel is supposed to be the only point of entry.

**Prevention:** Always bind container ports strictly to the loopback interface (`127.0.0.1:HOST_PORT:CONTAINER_PORT`) when an external reverse proxy or tunnel is expected to handle external traffic. This restricts access to only the local machine and prevents bypassing of intended ingress rules.