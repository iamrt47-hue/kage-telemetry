#!/bin/bash
TARGET="192.168.1.168:30443"

echo "[*] [PHASE 1: SUSONO-PIVOT] Passive X.509 TLS Handshake Inspection..."
echo | openssl s_client -connect "$TARGET" 2>/dev/null | openssl x509 -noout -subject -issuer -dates
echo "[*] [PHASE 1: SUSONO-PIVOT] Passive X.509 TLS Handshake Inspection..."
echo "[*] [フェーズ1: 裾野ピボット] パッシブ X.509 TLS ハンドシェイク検査中..."

echo ""
echo "[*] [PHASE 1: SUSONO-PIVOT] Rate-Limited HTTPS Surface Mapping..."
echo "[*] [PHASE 1: SUSONO-PIVOT] Rate-Limited HTTPS Surface Mapping..."
echo "[*] [フェーズ1: 裾野ピボット] レート制限付き HTTPS 攻撃対象領域マッピング中..."
printf "https://$TARGET/\nhttps://$TARGET/v1/auth/guest-token\nhttps://$TARGET/v1/telemetry/999\n" | \
  httpx-toolkit -sc -cl -server -td -rl 1 -random-agent -silent
  
