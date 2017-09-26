FROM alpine:latest

ENV UID 1000
ENV USER htpc
ENV GROUP htpc

ENV NETDATA_VERSION 2.11

RUN addgroup -S ${GROUP} && adduser -D -S -u ${UID} ${USER} ${GROUP} && \
    apk update && apk upgrade && apk add --no-cache curl

RUN curl -Ss 'https://raw.githubusercontent.com/firehol/netdata-demo-site/master/install-required-packages.sh' >/tmp/kickstart.sh && bash /tmp/kickstart.sh -i netdata --non-interactive --dont-wait && \
    curl -sL `curl -s https://api.github.com/repos/firehol/netdata/releases/latest | grep tarball_url | head -n 1 | cut -d '"' -f 4` | tar  xz -C /tmp && cd /tmp/* && \
./netdata-installer.sh --dont-wait --dont-start-it

EXPOSE 19999

VOLUME /etc/netdata

USER ${USER}

ENTRYPOINT /usr/sbin/netdata -D

