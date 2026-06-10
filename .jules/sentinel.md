## 2024-05-20 - [Prevent Docker port bypass of Cloudflare Tunnel]
**Vulnerability:** n8n port was bound to 0.0.0.0 (default), exposing the service directly to the internet if the host machine has a public IP, completely bypassing the intended Cloudflare Zero Trust Tunnel.
**Learning:** Docker bypasses UFW/iptables by default. Relying on a tunnel for security is useless if the container port is exposed on all interfaces.
**Prevention:** Always bind internal-only services to 127.0.0.1 (e.g., `127.0.0.1:5678:5678`) when exposing them for a local tunnel daemon.