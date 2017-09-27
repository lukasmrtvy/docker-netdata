FROM alpine:latest

ENV NETDATA_VERSION 1.8.0

RUN apk update && apk upgrade && apk add --no-cache curl bash && \
    curl -Ss 'https://raw.githubusercontent.com/firehol/netdata-demo-site/master/install-required-packages.sh' >/tmp/kickstart.sh && \
    mkdir -p /tmp/netdata && curl -sL https://github.com/firehol/netdata/releases/download/v${NETDATA_VERSION}/netdata-${NETDATA_VERSION}.tar.gz  | tar  xz -C /tmp/netdata --strip-components=1 && \
    bash /tmp/kickstart.sh -i netdata-all --non-interactive --dont-wait && \
    cd /tmp/netdata && sudo ./netdata-installer.sh  --dont-wait --dont-start-it && \
    apk del curl && rm -rf /tmp/*
    
EXPOSE 19999

VOLUME /etc/netdata

LABEL url=ttps://api.github.com/repos/firehol/netdata/releases/latest
LABEL name=netdata
LABEL version=${NETDATA_VERSION}

ENTRYPOINT /usr/sbin/netdata -D

