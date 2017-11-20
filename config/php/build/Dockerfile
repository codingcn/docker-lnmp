FROM php:7.1.11-fpm
RUN docker-php-ext-install pdo_mysql mysqli sockets opcache\
    && pecl install xdebug \
    && pecl install redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable xdebug redis
ADD $PWD/config/php/build/composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer
	&& composer config -g repo.packagist composer https://packagist.phpcomposer.com