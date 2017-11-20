FROM php:7.1.11-fpm

RUN docker-php-ext-install pdo_mysql mysqli sockets opcache\
    && pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug \
    && pecl install redis && docker-php-ext-enable redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable xdebug redis

