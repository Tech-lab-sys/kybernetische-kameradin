## 2026-06-26 - [Localhost Port Binding with Cloudflared]
**Vulnerability:** Docker container ports were bound to all interfaces (0.0.0.0), exposing internal services directly to external interfaces and bypassing the Cloudflare tunnel.
**Learning:** When using a Cloudflare tunnel for external access, local services must explicitly bind their exposed ports to localhost (127.0.0.1) to prevent direct external exposure.
**Prevention:** Always prefix port mappings in `docker-compose.yml` with `127.0.0.1:` (e.g., `127.0.0.1:5678:5678`) when the service is intended to be accessed exclusively via a secure tunnel.
