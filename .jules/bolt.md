## 2024-06-05 - n8n Execution Data and Raspberry Pi I/O
**Learning:** For resource-constrained edge devices like the Raspberry Pi 5 running off SD cards, continuous I/O from database writes can become a severe performance bottleneck and impact hardware lifespan. Saving successful execution data in n8n (`EXECUTIONS_DATA_SAVE_ON_SUCCESS: all`) causes continuous PostgreSQL disk writes for every scheduled run.
**Action:** Always set `EXECUTIONS_DATA_SAVE_ON_SUCCESS: none` for n8n deployments on Raspberry Pi or similar edge devices to reduce database I/O and minimize SD card wear.
