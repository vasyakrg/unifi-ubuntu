# Install Ubiquiti Unifi Controller on Ubuntu 20.04

## Ubuntu Server
- install ubuntu server 20.04
- create domain name <unifi.your-domain.com> and link with ip of server

## Install Unifi

- Install base soft
```
./base-install.sh
```

## Certificates

- Install certbot and create certificate (and setup alarm)
- <alarm-key> not necessary (include from [healthchecks.io](https://healthchecks.io))

```
./cert-install.sh <you domain> <alarm-key>
```
