# FROM java:8-jre
FROM errordeveloper/oracle-jre:latest

MAINTAINER Andrey K. Vital <andreykvital@gmail.com>

COPY dist/liquibase-3.3.5.tar.gz /tmp/liquibase.tar.gz
COPY dist/mysql-connector-java-5.1.35-bin.jar /opt/jdbc_drivers/

ENV LIQUIBASE_HOME /opt/liquibase

RUN mkdir /opt/liquibase && \
    cat /tmp/liquibase.tar.gz |gunzip |tar x -C /opt/liquibase && \
    chmod a+x /opt/liquibase/liquibase && \
    ln -s /opt/liquibase/liquibase /usr/bin/ && \
    ln -s /opt/jdbc_drivers/mysql-connector-java.5.1.35-bin.jar /usr/bin/ && \
    rm -rf /tmp/liquibase.tar.gz

VOLUME ["/ChangeLogs"]

ENTRYPOINT ["/bin/sh"]

WORKDIR /
