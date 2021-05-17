FROM alpine:3.13

LABEL maintainer="Lei.Lee <web.developer.network@gmail.com>"

COPY bootstrap.sh /usr/local/bin/bootstrap.sh

ENV LANG "en_US.UTF-8"

RUN set -xe \
    && apk add --no-cache --virtual .persistent-deps beanstalkd \
    && mkdir -p /var/lib/beanstalkd \
    && chmod +x /usr/local/bin/bootstrap.sh

EXPOSE 11300

ENTRYPOINT ["bootstrap.sh"]
