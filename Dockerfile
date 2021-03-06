############################
# STEP 1 build executable binary
############################
FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git bash wget curl
WORKDIR /go/src/v2ray.com/core
RUN git clone --progress https://github.com/v2fly/v2ray-core.git . && \
    bash ./release/user-package.sh nosource noconf codename=$(git describe --tags) buildname=docker-fly abpathtgz=/tmp/v2ray.tgz
############################
# STEP 2 build a small image
############################
FROM alpine

LABEL maintainer "punkmer <admin@dreamback.cc>"
COPY --from=builder /tmp/v2ray.tgz /tmp
COPY runv2.sh config.json /tmp/
RUN apk update && apk add ca-certificates && \
    mkdir -p /usr/bin/v2ray && \
    tar xvfz /tmp/v2ray.tgz -C /usr/bin/v2ray && \
    mv /tmp/runv2.sh /usr/bin/v2ray && mv /tmp/config.json /etc/v2ray

#ENTRYPOINT ["/usr/bin/v2ray/v2ray"]
ENV PATH /usr/bin/v2ray:$PATH
CMD ["sh", " /usr/bin/v2ray/runv2.sh"]
