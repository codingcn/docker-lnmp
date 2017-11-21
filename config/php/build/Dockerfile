FROM php:7.1.11-fpm
RUN docker-php-ext-install pdo_mysql mysqli sockets opcache\
  && pecl install xdebug \
  && pecl install redis \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable xdebug redis
# 支持cpmposer 运行方法：docker run -v $(pwd -P):/usr/www/html -it dockerlnmp_php composer
RUN apt-get update && apt-get install -y git curl wget cron vim \
  && rm -rf /var/lib/apt/lists/* \
  && pecl install zip \
  && wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer 
# ADD composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer \
  && composer config -g repo.packagist composer https://packagist.phpcomposer.com