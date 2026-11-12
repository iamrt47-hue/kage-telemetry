#!/bin/bash
BROKER="192.168.1.168"
PORT="31883"

echo "[*] [PHASE 3: KAGE-TELEMETRY] Attaching Shadow Listener to Smart-City MQTT Bus..."
echo "[*] Monitoring wildcard topics (#) silently. Press Ctrl+C to detach."
echo "--------------------------------------------------------------------------------"

mosquitto_sub -h "$BROKER" -p "$PORT" -t "#" -v
