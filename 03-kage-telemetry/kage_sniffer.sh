#!/bin/bash

# Force UTF-8 encoding so Japanese characters display properly
# 日本語文字が正しく表示されるようにUTF-8エンコーディングを強制する
export LANG=C.UTF-8
export LC_ALL=C.UTF-8

# Target MQTT Broker Configuration / ターゲットMQTTブローカー設定
BROKER="192.168.1.168"
PORT="31883"

# Bilingual Status Banner / バイリンガルステータスバナー
echo "[*] [PHASE 3: KAGE-TELEMETRY] Attaching Shadow Listener to Smart-City MQTT Bus..."
echo "[*] [フェーズ 3: 影テレメトリ] スマートシティMQTTバスにシャドウリスナーを接続中..."
echo ""
echo "[*] Monitoring wildcard topics (#) silently. Press Ctrl+C to detach."
echo "[*] ワイルドカードトピック (#) を静かに監視中。終了するには Ctrl+C を押してください。"
echo "--------------------------------------------------------------------------------"

# Subscribe to all topics in verbose mode / 詳細モードですべてのトピックを購読する
mosquitto_sub -h "$BROKER" -p "$PORT" -t "#" -v
