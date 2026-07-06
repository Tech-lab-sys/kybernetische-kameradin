## 2026-07-06 - Unbound Docker Port Exposure
**Vulnerability:** The n8n container port was mapped as `"5678:5678"`, binding it to all interfaces (0.0.0.0) and exposing it directly to the network.
**Learning:** Docker bypasses standard host firewalls (like UFW) when mapping ports. Even when using a tunnel (like Cloudflare), unbound ports remain publicly accessible on the host's IP.
**Prevention:** Always prefix port mappings with `127.0.0.1:` (e.g., `127.0.0.1:5678:5678`) to ensure services are only accessible locally or through the intended reverse proxy/tunnel.