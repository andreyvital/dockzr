FROM debian:7

MAINTAINER Andrey K. Vital <andreykvital@gmail.com>

RUN apt-get update && \
    apt-get install -yqq --fix-missing --no-install-recommends \
    git wget ca-certificates libpcre3 libpcre3-dev openssl libssl-dev build-essential \
    libfcgi-dev libfcgi0ldbl libjpeg62-dbg libmcrypt-dev libssl-dev \
    automake autoconf libtool libxml2 libxml2-dev openssl libcurl4-openssl-dev \
    libbz2-1.0 libbz2-dev libjpeg-dev libpng12-dev libfreetype6 libfreetype6-dev \
    libldap-2.4-2 libldap2-dev libmcrypt4 libmcrypt-dev libmysqlclient-dev \
    libxslt1.1 libxslt1-dev libxt-dev libevent-dev libyaml-dev libzmq-dev libicu48 libicu-dev && \
    mkdir -p /usr/src && \
    cd /usr/src && \
    wget -O php-5.6.10.tar.gz http://de1.php.net/get/php-5.6.10.tar.gz/from/this/mirror && \
    wget https://github.com/alanxz/rabbitmq-c/releases/download/v0.5.2/rabbitmq-c-0.5.2.tar.gz && \
    tar -zxvf php-5.6.10.tar.gz && \
    tar -zxvf rabbitmq-c-0.5.2.tar.gz && \
    cd /usr/src/rabbitmq-c-0.5.2 && autoreconf -i && ./configure && make -j"$(nproc)" && make install && \
    cd /usr/src/php-5.6.10 && \
    ./configure \
        --disable-rpath \
        --disable-short-tags \
        --enable-fpm \
        --enable-pdo \
        --enable-sockets \
        --enable-exif \
        --enable-soap \
        --enable-ftp \
        --enable-wddx \
        --enable-pcntl \
        --enable-soap \
        --enable-bcmath \
        --enable-mbstring \
        --enable-dba \
        --enable-gd-native-ttf \
        --enable-zip \
        --enable-calendar \
        --enable-dom \
        --enable-opcache \
        --with-mysql \
        --with-mysqli \
        --with-pdo-mysql \
        --with-pdo-sqlite \
        --with-iconv \
        --with-zlib \
        --with-bz2 \
        --with-gettext \
        --with-xmlrpc \
        --with-openssl \
        --with-mhash \
        --with-mcrypt \
        --with-xsl \
        --with-curl \
        --with-pcre-regex \
        --with-gd \
        --with-freetype-dir=/usr \
        --with-jpeg-dir=/usr \
        --with-png-dir=/usr \
        --with-ldap \
        --with-pear \
        --with-fpm-user=www-data \
        --with-fpm-group=www-data \
        --with-config-file-path=/etc/php/ \
        --with-config-file-scan-dir=/etc/php/conf.d/ \
        --with-libdir=lib/x86_64-linux-gnu && \
        make -j"$(nproc)" && make install && \
        mkdir -p /etc/php && \
        mkdir -p /var/www && \
        strip --strip-all /usr/local/bin/php && \
        strip --strip-all /usr/local/sbin/php-fpm && \
        yes '' |pecl install xdebug && \
        yes '' |pecl install redis && \
        yes '' |pecl install yaml-1.1.1 && \
        yes '' |pecl install libevent-0.1.0 && \
        yes '' |pecl install zmq-1.1.2 && \
        yes '' |pecl install apcu-4.0.7 && \
        yes '' |pecl install amqp && \
        yes '' |pecl install mongo && \
        yes '' |pecl install riak && \
        yes '' |pecl install SPL_Types && \
        yes '' |pecl install zip && \
        yes '' |pecl install memcache && \
        yes '' |pecl install mailparse && \
        yes '' |pecl install timezonedb && \
        yes '' |pecl install ssh2-0.12 && \
        yes '' |pecl install oauth && \
        yes '' |pecl install igbinary && \
        yes '' |pecl install msgpack-0.5.5 && \
        yes '' |pecl install intl && \
        yes '' |pecl install uploadprogress && \
        apt-get -y purge manpages manpages-dev wget git build-essential && \
        apt-get -y autoremove && \
        apt-get clean autoclean && \
        dpkg --list |grep ^rc |awk '{print $2;}' |xargs dpkg --purge && \
        rm -rf /tmp /usr/src /var/lib/{apt,dpkg,cache,log} && \
        rm -rf /usr/local/php/man/*

VOLUME ["/etc/conf", "/var/www"]

WORKDIR /var/www

EXPOSE 9000
