FROM debian:8

MAINTAINER Andrey K. Vital <andreykvital@gmail.com>

ADD init.sh /tmp/

RUN apt-get update && \
    apt-get install -yqq --fix-missing --no-install-recommends \
    wget sudo build-essential libssl-dev libperl-dev pkg-config && \
    mkdir -p /usr/src && \
    cd /usr/src && \
    mv /tmp/init.sh /usr/src/init.sh && chmod a+x /usr/src/init.sh && \
    wget -O znc.tar.gz http://znc.in/releases/archive/znc-1.6.0.tar.gz && \
    tar -zxf znc.tar.gz && \
    cd znc-1.6.0 && ./configure && \
    make && make install && \
    useradd znc && \
    apt-get -y purge manpages manpages-dev wget build-essential && \
    apt-get -y autoremove && apt-get clean autoclean && \
    rm -rf /tmp/* /usr/local/php/man/* /usr/src/*.tar.gz /var/lib/{apt,dpkg,cache,log}

EXPOSE 6667

CMD ["/usr/src/init.sh"]
