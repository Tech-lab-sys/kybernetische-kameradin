## 2024-06-09 - [Docker Port Binding Exposure]
**Vulnerability:** The `docker-compose.yml` mapped port `5678:5678`, causing Docker to implicitly bind it to `0.0.0.0`, thus exposing the container publicly on the host's network, bypassing the intended security of the Cloudflared tunnel.
**Learning:** When using secure access tunnels like Cloudflare Tunnels to mediate access, Docker container ports must explicitly bind to localhost `127.0.0.1:<host_port>:<container_port>` to prevent the default behavior of mapping to all network interfaces.
**Prevention:** Always verify Docker port bindings when implementing internal tunneling architectures to ensure internal services cannot be accessed directly via the host's IP address.
