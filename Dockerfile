FROM node:alpine as s3-to-minio

# Install deplendencies in a separate layer
ADD s3-to-minio/package.json /tmp/package.json
ADD s3-to-minio/yarn.lock /tmp/yarn.lock
RUN cd /tmp && yarn install
RUN mkdir -p /usr/app && cp -a /tmp/node_modules /usr/app/

# Build the app
WORKDIR /usr/app
ADD s3-to-minio/ /usr/app
RUN yarn build && \
    rm -rf src/ && \
    rm -rf test/

# Remove dev dependencies
RUN yarn install --production

FROM node:alpine

RUN apk --update add python py-pip zip groff less bash curl git && \
    pip install -U awscli && \
    apk --purge -v del py-pip && \
    rm -rf `find / -regex '.*\.py[co]'`

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && apk add --no-cache mysql-client postgresql-client mongodb-tools
ADD scripts/ /restore/scripts
COPY --from=s3-to-minio /usr/app /s3-to-minio