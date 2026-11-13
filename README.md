# 🥷 Kage-Telemetry (`🟣 Project JP Violet Synapse`)
### 影テレメトリー（🟣 プロジェクト JP バイオレット・シナプス）

> **GitHub Repository Description / リポジトリ概要:**  
> **EN:** *Four-phase CyberNinja purple-team simulation assessing and hardening an HTTPS autonomous shuttle telemetry gateway (`e-palette-phantom`). Demonstrates stealth HTTPS reconnaissance, token-based telemetry exfiltration, phantom payload injection with packet verification, and zero-trust Kubernetes network policy hardening aligned with Japanese enterprise security standards (ISMAP / 想定外の排除).*  
> **JP:** *HTTPS自律型シャトル・テレメトリーゲートウェイ（`e-palette-phantom`）を評価・堅牢化する4段階のサイバー忍者（CyberNinja）パープルチーム・シミュレーション。ステルスHTTPS偵察、トークンベースのテレメトリー抽出、パケット検証を伴うファントムペイロード注入、および日本のエンタープライズセキュリティ基準（ISMAP / 想定外の排除）に準拠したゼロトラストKubernetesネットワークポリシーによる堅牢化を実証します。*

---

## 📋 Overview / 概要

* **EN:** **Kage-Telemetry** ("Shadow Telemetry") is an infrastructure-focused offensive and defensive security simulation modeled after autonomous mobility and smart-city telemetry ecosystems in Japan. Operating under the **🟣 Project JP Violet Synapse** umbrella, this project tests the resilience of an internal shuttle telemetry gateway against unauthorized data exfiltration and payload spoofing, followed by full zero-trust network segmentation and Blue Team observability.
* **JP:** **Kage-Telemetry（影テレメトリー）**は、日本の自律走行モビリティおよびスマートシティのテレメトリーエコシステムをモデルにした、インフラ重視の攻撃・防御（パープルチーム）セキュリティシミュレーションです。**🟣 Project JP Violet Synapse**の傘下で運用され、内部シャトルのテレメトリーゲートウェイに対する不正なデータ抽出やペイロード偽装への耐性をテストし、その後ゼロトラスト・ネットワークセグメンテーションとブルーチームの可観測性（オブザーバビリティ）による完全な堅牢化を実施します。

### Core Philosophy / 基本理念
* **EN:** **想定外の排除 (*Sōteigai no haijo* — Eliminating the Unexpected):** Preventing unpredicted attack vectors through strict boundary validation, cryptographic verification, and continuous telemetry monitoring.
* **JP:** **想定外の排除（Sōteigai no haijo）:** 厳格な境界検証、暗号学的認証、および継続的なテレメトリー監視によって、予測不能な攻撃ベクトルを根本から排除します。### Phase 3: Kage-Telemetry — Phantom Injection & Sniffer Verification (`03-kage-telemetry`)
#### 第3段階：影テレメトリー — ファントム注入とスニッファー検証
* **Scripts / スクリプト:** `phantom_inject.sh`, `kage_sniffer.sh`
* **EN:** Launched `kage_sniffer.sh` to capture live packet flow while running `phantom_inject.sh` to inject crafted phantom telemetry payloads into the gateway. Demonstrated that unverified sensor coordinates were ingested by the backend, posing a corruption risk to downstream Digital Twin systems.
* **JP:** `kage_sniffer.sh` を起動してライブパケットフローを監視しながら、`phantom_inject.sh` を実行して細工されたファントム・テレメトリーペイロードをゲートウェイに注入しました。未検証のセンサー座標データがバックエンドに取り込まれることを実証し、下流のデジタルツインシステムが汚染されるリスクを明らかにしました。

---

## 🏗️ Lab Architecture / ラボ構成

* **Attack Node (攻撃ノード):** Parrot Security OS (`tornet-venv` / Live Persistence)
* **Target Node (標的ノード `woventargetnode`):** Rocky Linux Server hosting containerized telemetry services（コンテナ化されたテレメトリーサービスをホストするRocky Linuxサーバー）
* **Target Services (標的サービス):** Shuttle Telemetry HTTPS API (`:30443`) & Smart-City MQTT Broker (`:31883` → `:1883`)
* **Observability & SIEM (監視・SIEM):** Netdata (`:19999`) & centralized log aggregation（統合ログ収集）

```text
[ Parrot OS Attack Node (攻撃ノード) ] 
│  (HTTPS :30443 & MQTT :31883 Traffic)
▼
[ Rocky Linux Target Node (標的ノード) ] ──► [ Telemetry API & MQTT Broker ]
│
└──► [ Netdata Agent (:19999) ] ──► [ Blue Team SIEM / Alerting (監視・検知) ]

---

## ⚔️ The Four-Phase CyberNinja Operation / 4段階のサイバー忍者作戦

### Phase 1: Susono Pivot — Stealth Reconnaissance (`01-susono-pivot`)
#### 第1段階：裾野ピボット — ステルス偵察
* **Script / スクリプト:** `stealth_recon.sh`
* **EN:** Conducted targeted TLS and HTTP probing to map the encrypted telemetry gateway and inspect API route structures without triggering volumetric alerts. Discovered an exposed HTTPS telemetry ingestion endpoint accepting bearer-authenticated JSON payloads.
* **JP:** 大量トラフィックによるアラートを発生させることなく、暗号化されたテレメトリーゲートウェイの特定とAPIルート構造の調査を行うため、標的型のTLS/HTTPプロービングを実施しました。その結果、Bearer認証付きのJSONペイロードを受け入れる公開されたHTTPSテレメトリー受信エンドポイントを発見しました。

### Phase 2: E-Palette Phantom — Token Probing & Exfiltration (`02-e-palette-phantom`)
#### 第2段階：e-Palette ファントム — トークン検証とデータ抽出
* **Script / スクリプト:** `phantom_exfil.py`
* **EN:** Evaluated authentication controls, analyzed authorization headers, and executed `phantom_exfil.py` over HTTPS to extract the live shuttle telemetry matrix. Confirmed that overly permissive token scopes allowed unauthorized read/write access without device-level mTLS binding.
* **JP:** 認証制御の評価と認可ヘッダーの解析を行い、HTTPS経由で `phantom_exfil.py` を実行して稼働中のシャトル・テレメトリーデータを抽出しました。デバイスレベルのmTLSバインディングが欠如しており、過剰な権限を持つトークンスコープによって不正な読み書きが可能であることを確認しました。

### Phase 3: Kage-Telemetry — Phantom Injection & Sniffer Verification (`03-kage-telemetry`)
#### 第3段階：影テレメトリー — ファントム注入とスニッファー検証
* **Scripts / スクリプト:** `phantom_inject.sh`, `kage_sniffer.sh`
* **EN:** Attached `kage_sniffer.sh` to the Smart-City MQTT bus (`:31883`) to monitor wildcard topics (`#`) while running `phantom_inject.sh` to publish spoofed telemetry payloads into `woven/mobility/epalette/unit-07/route`. Demonstrated that unauthenticated MQTT messages were accepted by the broker, posing a corruption risk to downstream Digital Twin systems.
* **JP:** `kage_sniffer.sh` をスマートシティMQTTバス（`:31883`）に接続してワイルドカードトピック（`#`）を監視しながら、`phantom_inject.sh` を実行して `woven/mobility/epalette/unit-07/route` に偽装テレメトリーペイロードを公開しました。未認証のMQTTメッセージがブローカーに受理されることを実証し、下流のデジタルツインシステムが汚染されるリスクを明らかにしました。

### Phase 4: Fuji Grid Zero — Zero-Trust Hardening (`04-fuji-grid-zero`)
#### 第4段階：富士グリッド・ゼロ — ゼロトラスト堅牢化
* **Policy / ポリシー:** `fuji-grid-zero-policy.yaml`
* **EN:** Applied a zero-trust Kubernetes `NetworkPolicy` (`fuji-grid-zero-policy.yaml`) to restrict pod-level ingress strictly to verified internal broker proxies. Paired network isolation with **Netdata (`:19999`)** anomaly alerting for API request spikes, alongside recommendations for Mutual TLS (mTLS) device pinning and strict JSON schema validation.
* **JP:** ゼロトラストのKubernetes `NetworkPolicy`（`fuji-grid-zero-policy.yaml`）を適用し、Podレベルのインバウンド通信（Ingress）を検証済みの内部ブローカープロキシのみに厳格に制限しました。ネットワーク分離に加え、APIリクエストの急増を検知する **Netdata（`:19999`）** の異常アラート監視を導入し、相互TLS（mTLS）によるデバイス認証と厳格なJSONスキーマ検証を実装指針として策定しました。

---

## 📂 Repository Structure / リポジトリ構成

```text
kage-telemetry/
├── 01-susono-pivot/
│   └── stealth_recon.sh          # Phase 1: TLS/HTTPS stealth service & endpoint reconnaissance (ステルス偵察)
├── 02-e-palette-phantom/
│   └── phantom_exfil.py          # Phase 2: Authenticated telemetry probe & data exfiltration (トークン検証・抽出)
├── 03-kage-telemetry/
│   ├── kage_sniffer.sh           # Phase 3: Live packet capture & traffic verification (パケット監視・検証)
│   └── phantom_inject.sh         # Phase 3: Crafted phantom telemetry payload injection (ファントムデータ注入)
├── 04-fuji-grid-zero/
│   └── fuji-grid-zero-policy.yaml # Phase 4: Zero-trust Kubernetes NetworkPolicy remediation (ゼロトラスト堅牢化)
└── README.md                     # Bilingual project documentation (バイリンガル技術ドキュメント)
```

---

## 🛠️ Deployment & Verification / 実行と検証

```bash
# 1. Clear and update README.md / READMEの更新
cd /home/live/development/kage-telemetry
> README.md
nano README.md

# 2. Push final bilingual documentation to GitHub / GitHubへのプッシュ
git add README.md
git commit -m "Finalize bilingual EN/JP README.md for Kage-Telemetry"
git push origin main
```
