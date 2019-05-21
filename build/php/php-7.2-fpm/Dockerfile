FROM php:7.2.2-fpm-alpine3.7

MAINTAINER Alan <5303221@gmail.com>

RUN echo http://mirrors.aliyun.com/alpine/v3.7/main > /etc/apk/repositories; \
    echo http://mirrors.aliyun.com/alpine/v3.7/community >> /etc/apk/repositories \
  && apk update \
  && apk add --no-cache \
  # 注：alpine系统必须添加此项，PECL才能正常工作
  $PHPIZE_DEPS \
  linux-headers autoconf libmcrypt libmcrypt-dev  libpng-dev postgresql-dev freetype-dev libpng-dev libjpeg-turbo-dev freetype libpng libjpeg-turbo \
   # php >=7.0 (use libvpx for php <7.0)
   libwebp-dev \
  && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
  && docker-php-ext-configure gd \
    --with-jpeg-dir=/usr/include --with-png-dir=/usr/include --with-webp-dir=/usr/include --with-freetype-dir=/usr/include \
  && docker-php-ext-install -j${NPROC}  iconv \
  && docker-php-ext-install gd pdo_mysql pdo_pgsql mysqli sockets opcache zip \
  && pecl install xdebug-2.6.0 \
  && pecl install redis \
  && pecl install swoole \
  && pecl install mcrypt-1.0.1 \
  && pecl install mongodb \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable xdebug redis swoole  mcrypt mongodb \
  && apk del --no-cache linux-headers autoconf libmcrypt libmcrypt-dev libpng-dev postgresql-dev


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
