#!/usr/local/bin/bash
set -e

echo "======== $(basename $0) "

echo "Getting a random P2P NordVPN server"

URL="https://api.nordvpn.com/server"
SERVER=$(curl -s "$URL" | jq -r '.[] | select(.search_keywords | index("P2P")) | .domain' | sort -R | head -n1)
SERVER_FILE="https://downloads.nordcdn.com/configs/files/ovpn_udp/servers/${SERVER}.udp.ovpn"

echo "Chosen: ${SERVER_FILE}"
/usr/local/bin/curl -s "${SERVER_FILE}" -o "/usr/local/etc/openvpn/client.conf"

echo "========================================="
