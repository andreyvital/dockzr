#!/usr/bin/env sh
chown -R znc:znc "/data"
mkdir -p "/data/configs"
exec sudo -u znc znc --foreground --datadir="/data" $@
