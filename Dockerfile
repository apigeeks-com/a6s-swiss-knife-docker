FROM alpine:3.8

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && apk add --no-cache mysql-client postgresql-client mongodb-tools aws-cli
