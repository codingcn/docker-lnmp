FROM php:7.1.11-fpm

RUN docker-php-ext-install pdo_mysql mysqli sockets opcache spl simplexml mbstring mcrypt gd fileinfo\
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && pecl install redis && docker-php-ext-enable redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable xdebug redis

# COPY ./config/php.ini /usr/local/etc/php/conf.d/
