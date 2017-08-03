#!/bin/bash
set -e

echo "=> Configuring Keepalived"
sed -i -e "s/VIP/${VIP}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/ETH/${ETH}/g" /etc/keepalived/keepalived.conf
sed -i -e "s/PRI/${PRI}/g" /etc/keepalived/keepalived.conf

echo "=> Done!"
