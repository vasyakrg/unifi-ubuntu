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
- `alarm-key` not necessary (include from [healthchecks.io](https://healthchecks.io))

```
./cert-install.sh <you domain> <alarm-key>
```


## Бонус
- [коннектор для API](bonus/pingen-connector/README.md)
- [утилита для выдачи ваучеров](bonus/pingen-executor/README.md)

## Видео к курсу
- [видео](https://youtu.be/V9wPixm8iyc)
- [презентация](https://drive.google.com/file/d/1BYhYtjVdPCbBO-vtPyotYhay2IWOPiZ4/view?usp=sharing)

##### Автор
- **Vassiliy Yegorov** [vasyakrg](https://github.com/vasyakrg)
- [сайт](https://vk.com/realmanual)
- [youtube](https://youtube.com/realmanual)
- [группа в телеге](https://t.me/realmanual_group)
