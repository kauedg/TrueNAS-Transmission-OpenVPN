#!/usr/bin/env bash
set -e

TRANSMISSION_HOME="/usr/local/etc/transmission/home"

echo "======== $(basename $0) "

cd scripts

service transmission status && service transmission stop

echo "Getting a new VPN server configuration file"
. ./get_conf.sh

echo "Disabling all current resolvconf interfaces configurations"
rm -rf /var/run/resolvconf/interfaces/*

echo "Creating the resolvconf configuration for the VPN"
. ./update-resolv-conf.sh

echo "Configuring the bind address for Transmission"
sed -I "" "s/\(\"bind-address-ipv4\": \).*/\1\""$ifconfig_local"\",/g" "${TRANSMISSION_HOME}/settings.json"

service transmission start
echo "========================================="
