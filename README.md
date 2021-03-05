# Install Ubiquiti Unifi Controller on Ubuntu 20.04

## Ubuntu Server
- install ubuntu server 20.04

## Install Unifi

- Install base soft
```
./base-install.sh
```

## Certificates

- nano crt - создаем файл crt, туда помещаем содержимое файла crt (ваш купленный сертификат)
- nano key - создаем файл key, туда помещаем содержимое файла key (ваш купленный сертификат)
- nano ca - создаем файл ca, туда помещаем содержимое файла ca (ваш купленный сертификат)
- запускаем сборку закрытого серта p12 из того, что создали (запускаем как есть, ничего не меняя)
```
openssl pkcs12 -export -in crt -inkey key -out cloudkey.p12 -name unifi -CAfile ca -caname root -password pass:aircontrolenterprise
```

- запускаем импорт серта в хранилище сертификатов
```
keytool -importkeystore -deststorepass aircontrolenterprise -destkeypass aircontrolenterprise -destkeystore /usr/lib/unifi/data/keystore -srckeystore cloudkey.p12 -srcstoretype PKCS12 -srcstorepass aircontrolenterprise -alias unifi
```

-задаем (восстанавливаем по сути) права на папки с сертами
```
chown root:ssl-cert /etc/ssl/private/* && chmod 640 /etc/ssl/private/*
```

- перезапускает службы (долго, минуты 2-3)
```
/etc/init.d/nginx restart && /etc/init.d/unifi restart
```

- радуемся сертификату до завершения срока протухания серта
