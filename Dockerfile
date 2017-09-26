FROM alpine:latest

ENV UID 1000
ENV USER htpc
ENV GROUP htpc

ENV NETDATA_VERSION 1.8.0

RUN addgroup -S ${GROUP} && adduser -D -S -u ${UID} ${USER} ${GROUP} && \
    apk update && apk upgrade && apk add --no-cache curl

RUN mkdir -p /tmp/netdata && curl -sL https://github.com/firehol/netdata/releases/download/v${NETDATA_VERSION}/netdata-${NETDATA_VERSION}.tar.gz  | tar  xz -C /tmp/netdata --strip-components=1

RUN cd /tmp/netdata && bash /tmp/kickstart.sh -i netdata --non-interactive --dont-wait &&  ./netdata-installer.sh --dont-wait --dont-start-it

EXPOSE 19999

VOLUME /etc/netdata

USER ${USER}

ENTRYPOINT /usr/sbin/netdata -D

