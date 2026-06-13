## 2024-06-13 - n8n Execution Data I/O Optimization on Edge Devices
**Learning:** Saving execution data for successful n8n runs on edge devices (like Raspberry Pi 5) creates a significant and unnecessary database I/O bottleneck and wastes disk space, especially with frequent background workflows.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` in `docker-compose.yml` for production deployments on edge devices to maximize performance and prolong SD card/storage life.
