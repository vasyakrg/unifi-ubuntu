#!/bin/bash

source /etc/letsencrypt/renewal-hooks/post/.env

ca=/etc/letsencrypt/live/${DOMAIN}/chain.pem
crt=/etc/letsencrypt/live/${DOMAIN}/cert.pem
key=/etc/letsencrypt/live/${DOMAIN}/privkey.pem

openssl pkcs12 -export -in $crt -inkey $key -out cloudkey.p12 -name unifi -CAfile $ca -caname root -password pass:aircontrolenterprise

keytool -importkeystore -noprompt -deststorepass aircontrolenterprise -destkeypass aircontrolenterprise -destkeystore /usr/lib/unifi/data/keystore -srckeystore cloudkey.p12 -srcstoretype PKCS12 -srcstorepass aircontrolenterprise -alias unifi &>/dev/null

service unifi stop
service unifi start
