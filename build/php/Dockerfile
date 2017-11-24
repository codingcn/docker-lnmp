FROM php:7.1.11-fpm

MAINTAINER Alan <5303221@gmail.com>
RUN docker-php-ext-install pdo_mysql mysqli sockets opcache \
  && pecl install xdebug \
  && pecl install redis \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable xdebug redis 