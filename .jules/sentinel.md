## 2025-06-23 - Prevent Direct Port Exposure and Data Logging
**Vulnerability:** Port 5678 was directly bound to 0.0.0.0, bypassing the Cloudflare tunnel and allowing potential external access. Additionally, successful execution data containing PII and secrets was being saved.
**Learning:** Docker compose ports bind to 0.0.0.0 by default, which overrides firewall rules and exposes the service. Saving successful execution data by default in n8n creates a significant data privacy and security risk.
**Prevention:** Always bind internal-only ports to localhost (127.0.0.1) in docker-compose.yml (`127.0.0.1:port:port`). Explicitly configure n8n to not save successful execution data using `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none`.
