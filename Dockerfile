FROM alpine
MAINTAINER Gerard Hickey <hickey@kinetic-compute.com>

RUN apk update && apk add ruby curl jq && \
    gem install semi --no-ri --no-rdoc && \
    mkdir -p /data/crontabs

ADD semi.conf /etc/semi.conf
ADD README.md /README.md

WORKDIR /data/scripts

ENTRYPOINT ["semi"]