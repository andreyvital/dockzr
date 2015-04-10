FROM debian:7

MAINTAINER Andrey K. V. <andreykvital@gmail.com>

RUN apt-get update && \
    apt-get install -y git wget libpcre3 libpcre3-dev openssl libssl-dev build-essential \
        lua5.1 liblua5.1-0 liblua5.1-0-dev && \
    ln -s /usr/lib/x86_64-linux-gnu/liblua5.1.so /usr/lib/liblua.so && \
    mkdir -p /usr/src && \
    wget -O /usr/src/nginx-1.7.9.tar.gz http://nginx.org/download/nginx-1.7.9.tar.gz && \
    cd /usr/src && tar -zxvf nginx-1.7.9.tar.gz && \
    git clone https://github.com/simpl/ngx_devel_kit && \
    git clone https://github.com/openresty/lua-nginx-module && \
    git clone https://github.com/openresty/headers-more-nginx-module headers-more-nginx-module && \
    git clone https://github.com/openresty/echo-nginx-module.git && \
    cd /usr/src/nginx-1.7.9 && \
    ./configure --user=www-data \
                --group=www-data \
                --prefix=/etc/nginx \
                --sbin-path=/usr/sbin/nginx \
                --conf-path=/etc/nginx/nginx.conf \
                --error-log-path=/var/log/nginx/error.log \
                --http-log-path=/var/log/nginx/access.log \
                --pid-path=/var/run/nginx.pid \
                --lock-path=/var/run/nginx.lock \
                --with-http_ssl_module \
                --with-pcre \
                --with-ld-opt='-Wl,-rpath,/usr/include/lua5.1' \
                --add-module=../headers-more-nginx-module \
                --add-module=../ngx_devel_kit \
                --add-module=../lua-nginx-module \
                --add-module=../echo-nginx-module && \
    make -j2 && \
    make install && \
    mkdir -p /etc/conf && \
    rm -f /etc/nginx/nginx.conf && \
    apt-get -y purge pkg-config manpages manpages-dev wget git build-essential gcc-4.7 && \
    apt-get clean autoclean && \
    apt-get -y autoremove && \
    rm -rf  /tmp /etc/nginx/html /usr/src /etc/nginx/*.default /var/lib/apt/lists/* && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

VOLUME ["/etc/conf", "/var/www"]

WORKDIR /var/www

EXPOSE 80
EXPOSE 443
