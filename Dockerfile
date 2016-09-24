FROM ubuntu:trusty

MAINTAINER ivan@lagunovsky.com

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends duplicity ca-certificates s3cmd haveged apg python-boto python-paramiko cron \
    && apt-get autoclean

COPY ./duplicity-backup/duplicity-backup.conf /duplicity-backup.conf
COPY ./duplicity-backup/duplicity-backup.sh /duplicity-backup.sh
RUN chmod +x /duplicity-backup.sh

COPY ./scripts/start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /var/log/duplicity && touch /var/log/duplicity/backup.log

VOLUME /var/backup

CMD ["/start.sh"]
