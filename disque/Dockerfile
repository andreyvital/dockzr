FROM debian:7

MAINTAINER Andrey K. Vital <andreykvital@gmail.com>

RUN \
    apt-get update && \
    apt-get install -yqq --fix-missing --no-install-recommends \
    git build-essential ca-certificates && \
    git clone https://github.com/antirez/disque.git /tmp/disque && \
    cd /tmp/disque && make install >/dev/null 2>&1 && \
    mkdir -p /etc/disque && mkdir /data && \
    cat /tmp/disque/disque.conf |grep -v '^$\|^#' >/etc/disque/disque.conf && \
    sed -i 's/^\(dir .*\)$/dir \/data/' /etc/disque/disque.conf && \
    apt-get -y purge manpages manpages-dev git build-essential && \
    apt-get -y autoremove && apt-get clean autoclean && \
    rm -rf \
        /tmp/* /var/lib/{apt,dpkg,cache,log} \
        /usr/share/man/* /usr/share/groff/* /usr/share/info/* \
        /usr/share/lintian/* /usr/share/linda/* /var/cache/man/*

VOLUME ["/data"]

WORKDIR /data

CMD ["disque-server", "/etc/disque/disque.conf"]

EXPOSE 7711
