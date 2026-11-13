#!/bin/bash

# Ensure we are in the project root / プロジェクトルートへ移動
cd /home/live/development/kage-telemetry || exit 1

# Grant execute permissions / 実行権限を付与
chmod +x 01-susono-pivot/*.sh 02-e-palette-phantom/*.py 03-kage-telemetry/*.sh

echo "===================================================================="
echo "=== [PHASE 1: SUSONO-PIVOT / 第1段階：裾野ピボット] ==="
echo "===================================================================="
./01-susono-pivot/stealth_recon.sh

echo ""
echo "===================================================================="
echo "=== [PHASE 2: E-PALETTE-PHANTOM / 第2段階：e-Palette ファントム] ==="
echo "===================================================================="
python3 ./02-e-palette-phantom/phantom_exfil.py

echo ""
echo "===================================================================="
echo "=== [PHASE 3: KAGE-TELEMETRY / 第3段階：影テレメトリ] ==="
echo "===================================================================="
# Run sniffer in a background subshell for 8 seconds / スニッファーをバックグラウンドで8秒間起動
(timeout 8s ./03-kage-telemetry/kage_sniffer.sh &)

# Wait 2 seconds for sniffer to connect, then inject payload / 接続待機後にペイロードを注入
sleep 2
./03-kage-telemetry/phantom_inject.sh

# Wait 6 seconds for sniffer to finish capturing and exit / キャプチャ完了まで待機
sleep 6

echo ""
echo "===================================================================="
echo "=== [PHASE 4: FUJI-GRID-ZERO / 第4段階：富士グリッド・ゼロ] ==="
echo "===================================================================="
cat ./04-fuji-grid-zero/verification.log
