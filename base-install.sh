#!/bin/bash

apt update

apt install -y ca-certificates apt-transport-https mc htop zip wget curl git net-tools gnupg2

echo 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list && apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50

wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc | apt-key add -
echo 'deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse' | tee /etc/apt/sources.list.d/mongodb-org-3.4.list

apt update

LIBSSL=libssl1.0.0_1.0.2n-1ubuntu5_amd64.deb

wget http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0/${LIBSSL} -P /tmp || {
  echo "You must change link for a file at http://security.ubuntu.com/ubuntu/pool/main/o/openssl1.0"
  exit 1
}

apt install -y /tmp/${LIBSSL} &&
rm /tmp/${LIBSSL}

apt install -y openjdk-8-jre-headless && apt install -y mongodb-org unifi


