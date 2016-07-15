FROM alpine

MAINTAINER Yuri Vysotskiy (yfix) <yfix.dev@gmail.com>

RUN apk add \
    inotify-tools \
    supervisor \
    curl

COPY docker /

WORKDIR /etc/supervisor/conf.d

CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
