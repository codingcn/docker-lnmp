FROM php:7.1.11-fpm
RUN docker-php-ext-install pdo_mysql mysqli sockets opcache zip\
  && pecl install xdebug \
  && pecl install redis \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable xdebug redis
# 支持cpmposer 运行方法：docker run -v $(pwd -P):/usr/www/html -it dockerlnmp_php composer
RUN apt-get update && apt-get install -y git curl wget cron\
  && rm -rf /var/lib/apt/lists/* 
RUN wget https://getcomposer.org/composer.phar -O /usr/local/bin/composer 
# ADD composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer \
  && composer config -g repo.packagist composer https://packagist.phpcomposer.com \
  $$ echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc \
  && . ~/.bashrc 