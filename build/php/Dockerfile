FROM php:7.2.0-fpm

MAINTAINER Alan <5303221@gmail.com>

# 更新apt-get源 使用163的源
RUN apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng-dev \
  && docker-php-ext-install pdo_mysql mysqli sockets opcache zip\
  && docker-php-ext-install -j$(nproc) mcrypt \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && pecl install xdebug \
  && pecl install redis \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable xdebug redis 