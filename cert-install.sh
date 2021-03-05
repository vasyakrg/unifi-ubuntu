#!/bin/bash

DOMAIN=$1
ALARM_KEY=$2

[ -z ${DOMAIN} ] && {
  echo "Usage: ./cert-install.sh <you domain> <alarm-key>"
  echo "<alarm-key> not necessary"
  echo "Example: ./cert-install.sh unifi-test.mydomain.com"
  echo "Example with alarm-key:"
  echo "Example: ./cert-install.sh unifi-test.mydomain.com ed70094f-c3cf-4812-94fb-138af219ec99"
  exit 1
}

add-apt-repository -y ppa:certbot/certbot
apt-get update
apt-get install -y certbot

certbot certonly --agree-tos --no-eff-email --standalone --preferred-challenges http -d ${DOMAIN} && {

  echo "0 6 1 * * /usr/bin/certbot renew" | crontab -

  cp cert-renew.sh /etc/letsencrypt/renewal-hooks/post/

  echo "DOMAIN=${DOMAIN}" > /etc/letsencrypt/renewal-hooks/post/.env
  [ ! -z ${ALARM_KEY} ] echo "ALARM_KEY=${ALARM_KEY}" >> /etc/letsencrypt/renewal-hooks/post/.env

  echo "renew_hook = /etc/letsencrypt/renewal-hooks/post/cert-renew.sh" >> /etc/letsencrypt/renewal/${DOMAIN}.conf

  ./cert-renew.sh
}
