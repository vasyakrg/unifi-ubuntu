# Генератор для ваучеров

- что бы генератор работал, ему нужен [pingen-connector](../pingen-connector/README.md)
- если нужно отправлять смс при генерации, идем в [smsc.ru](smsc.ru), регаемся и закидываем денег
- идем в `config.ini` и заполняем переменные:

`controlleruser` - юзер, для доступа в веб-панель Unifi
`controllerpassword` - его пароль
`controllerurl` - доменное имя Unifi, например unifi.domain.ru
`controllerport=8443` - порт Inifi панели (по дефолту 8443)
`controllerversion=6.0.45` - версия панели
`siteid=default` -  сайт, на котором нужно выпустить настройки (видно в правом верхнем углу в веб-панели Unifi)

`connectorip` - доменное имя, где запущен pingen-connector, например unifi.domain.ru
`connectorport=8090` - порт pingen-connector (по дефолту 8443)

`smslogin=` - логин в [smsc.ru](smsc.ru)
`smspassword=` - пароль в [smsc.ru](smsc.ru)
`companylabel=` - имя, которое будет в подписи внизу смс (например unifi.ru)

- запускаем и пользуемся

## Твики
- если выходит ошибка сокета 11002 - проверяем переменную connectorip и за одно, что текущая машина в принципе может открыть адрес `http://connectorip:connectorport`
