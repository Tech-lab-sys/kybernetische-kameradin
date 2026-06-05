## 2024-06-05 - Docker Port Bindings Bypass Host Firewalls

**Vulnerability:** The n8n service in `docker-compose.yml` was bound to `5678:5678`. When Docker binds a port in this manner, it modifies iptables directly and exposes the port on *all* network interfaces (0.0.0.0). This bypasses the host's UFW/firewall rules, directly exposing the internal service to the public internet, even if a Cloudflared tunnel is configured to handle the traffic.

**Learning:** This codebase relies on a zero-trust edge architecture via a Cloudflared tunnel. Binding ports openly breaks this architecture by providing an alternative, unencrypted, direct entry point that bypasses Cloudflare entirely. This pattern is common when copy-pasting standard docker-compose examples but is fatal in a zero-trust setup.

**Prevention:** Always bind internal Docker services that are meant to be accessed via reverse proxy or tunnel explicitly to localhost (e.g., `127.0.0.1:PORT:PORT`). This ensures they are only accessible from the host machine itself, forcing all external traffic through the intended secure entry point (Cloudflared).