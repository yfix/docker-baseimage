FROM ubuntu:14.04

MAINTAINER Yuri Vysotskiy (yfix) <yfix.dev@gmail.com>

RUN apt-get update && apt-get install -y \
    inotify-tools \
    supervisor \
  \
  && sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf \
  \
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

COPY container-files /

WORKDIR /etc/supervisor/conf.d

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
