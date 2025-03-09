#!/bin/bash

LIMITED_CONF="dynamic_conf_ip_whitelist.yml"
UNLIMITED_CONF="dynamic_conf_no_limit.yml"
CURRENT_CONF="dynamic_conf.yml"

if cmp -s "$CURRENT_CONF" "$LIMITED_CONF"; then
    echo "Switching to unrestricted access..."
    cp "$UNLIMITED_CONF" "$CURRENT_CONF"
else
    echo "Switching to restricted access..."
    cp "$LIMITED_CONF" "$CURRENT_CONF"
fi

docker restart traefik-ip-limiter
