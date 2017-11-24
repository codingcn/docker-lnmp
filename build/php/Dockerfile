FROM php:7.1.11-fpm
RUN docker-php-ext-install pdo_mysql mysqli sockets opcache \
  && pecl install xdebug \
  && pecl install redis \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable xdebug redis \
  && echo "pdo_mysql.default_socket=/var/run/mysqld/mysqld.sock" >> /usr/local/etc/php/conf.d/mysql_socket.ini \
  && echo "mysql.default_socket=/var/run/mysqld/mysqld.sock" >> /usr/local/etc/php/conf.d/mysql_socket.ini \
  && echo "mysqli.default_socket=/var/run/mysqld/mysqld.sock" >> /usr/local/etc/php/conf.d/mysql_socket.ini