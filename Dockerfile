FROM --platform=$TARGETPLATFORM ubuntu

ARG TARGETPLATFORM

RUN apt update
RUN apt install -y curl bash cron
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh
RUN apt remove -y curl

ADD https://raw.githubusercontent.com/spotify/docker-gc/master/docker-gc /usr/bin/docker-gc
COPY build/executed-by-cron.sh /executed-by-cron.sh
COPY build/generate-crontab.sh /generate-crontab.sh

RUN chmod 0755 /usr/bin/docker-gc
RUN chmod 0755 /generate-crontab.sh
RUN chmod 0755 /executed-by-cron.sh

CMD /generate-crontab.sh > /var/log/cron.log 2>&1 \
  && cron \
  && tail -f /var/log/cron.log
