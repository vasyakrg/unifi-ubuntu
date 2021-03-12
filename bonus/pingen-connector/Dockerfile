FROM php:7.4-apache-buster

COPY app/ /var/www/html

RUN rm /etc/apache2/sites-enabled/*
COPY config/site.conf /etc/apache2/sites-enabled/site.conf
RUN a2enmod rewrite headers

COPY docker/entrypoint.sh /usr/local/bin/entrypoint

RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]
