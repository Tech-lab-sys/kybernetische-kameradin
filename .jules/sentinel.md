## 2024-06-29 - Insecure Port Binding and Data Exposure in n8n
**Vulnerability:** The n8n port was exposed to all network interfaces, and successful execution data containing potential PII and secrets were saved to disk.
**Learning:** Docker compose ports bind to 0.0.0.0 by default, bypassing host firewalls. Saving execution data persistently by default leaks sensitive payload info.
**Prevention:** Always bind ports specifically to `127.0.0.1` for local-only services and set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in n8n to avoid persisting sensitive data.
