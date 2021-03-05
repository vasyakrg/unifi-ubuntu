#!/bin/bash

DOMAIN=$1

[ -z ${DOMAIN} ] && {
  echo "Usage: ./cert-install.sh <you domain>"
  echo "Example: ./cert-install.sh unifi-test.mydomain.com"
  exit 1
}

echo "DOMAIN=${DOMAIN}" > .env

add-apt-repository -y ppa:certbot/certbot
apt-get update
apt-get install -y certbot

certbot certonly --agree-tos --no-eff-email --standalone --preferred-challenges http -d ${DOMAIN} && {

  echo "0 6 1 * * /usr/bin/certbot renew" | crontab -

  cp cert-renew.sh /etc/letsencrypt/renewal-hooks/post/
  echo "DOMAIN=${DOMAIN}" > /etc/letsencrypt/renewal-hooks/post/.env
  echo "renew_hook = /etc/letsencrypt/renewal-hooks/post/cert-renew.sh" >> /etc/letsencrypt/renewal/${DOMAIN}.conf

  ./cert-renew.sh
}
