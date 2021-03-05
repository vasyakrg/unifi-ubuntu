#!/bin/bash

DOMAIN=$1

[ -z ${DOMAIN} ] && {
  echo "Usage: ./cert-install.sh <you domain>"
  echo "Example: ./cert-install.sh unifi-test.mydomain.com"
  exit 1
}

add-apt-repository -y ppa:certbot/certbot
apt-get update
apt-get install -y certbot

certbot certonly --standalone --preferred-challenges http -d ${DOMAIN} && {

  echo "0 6 1 * * /usr/bin/certbot renew" | crontab -
  echo "renew_hook = $(pwd)/cert-renew.sh" >> /etc/letsencrypt/renewal/${DOMAIN}.conf

  ./cert-renew.sh
}
