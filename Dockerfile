FROM alpine

MAINTAINER Yuri Vysotskiy (yfix) <yfix.dev@gmail.com>

RUN apk add \
    inotify-tools \
    supervisor \
    curl \
    wget \
  \
  && sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf \
  \
  && rm /bin/sh && ln -s /bin/bash /bin/sh

COPY docker /

WORKDIR /etc/supervisor/conf.d

CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
