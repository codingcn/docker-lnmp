FROM php:7.3.5-fpm-stretch

MAINTAINER Alan <5303221@gmail.com>

# 更新apt-get源 使用163的源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
  echo "deb http://mirrors.163.com/debian/ stretch main non-free contrib" >/etc/apt/sources.list && \
  echo "deb http://mirrors.163.com/debian/ stretch-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
  echo "deb-src http://mirrors.163.com/debian/ stretch main non-free contrib" >>/etc/apt/sources.list && \
  echo "deb-src http://mirrors.163.com/debian/ stretch-proposed-updates main non-free contrib" >>/etc/apt/sources.list \
  && apt-get update && apt-get install -y \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libzip-dev \
  libmcrypt-dev \
  && docker-php-ext-install pdo_mysql mysqli sockets opcache zip\
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd \
  && pecl install xdebug \
  && pecl install redis \
  && pecl install swoole \
  # php从7.2开始不再在源码里支持mcrypt扩展而转到pecl方式支持
  && pecl install mcrypt-1.0.2 \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable xdebug redis swoole mcrypt


# 安装composer并允许root用户运行
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_NO_INTERACTION=1
ENV COMPOSER_HOME=/usr/local/share/composer
RUN mkdir -p /usr/local/share/composer \
	&& curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
	&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
	&& rm -f /tmp/composer-setup.* \
    # 配置composer中国全量镜像
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com
