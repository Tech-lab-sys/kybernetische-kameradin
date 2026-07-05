## 2024-07-05 - Port Binding Exposure & Sensitive Data Leakage

**Vulnerability:** The n8n container port 5678 was bound to 0.0.0.0, exposing the service directly to the network and bypassing the Cloudflare tunnel. Additionally, successful execution data was being saved, risking PII and secret leakage in the database.
**Learning:** Default Docker Compose port bindings map to all network interfaces. Cloudflare tunnel setups require explicit localhost binding to enforce tunnel-only access.
**Prevention:** Always bind container ports to 127.0.0.1 when external access is intended to be routed exclusively through a secure tunnel. Ensure execution data saving for successful runs is disabled.
