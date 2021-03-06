#!/bin/sh

# create new certs
cd /opt/letsencrypt

for conf in $(ls /etc/letsencrypt/configs/*.conf); do
  ./letsencrypt-auto --renew-by-default --config "$conf" certonly
done

# make sure nginx picks them up
systemctl restart nginx
