FROM ubuntu:latest

MAINTAINER ivan@lagunovsky.com

RUN apt-get update \
    && apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends duplicity ca-certificates s3cmd haveged apg python-boto python-paramiko cron \
    && apt-get autoclean 

ADD /duplicity-backup/duplicity-backup.sh /duplicity-backup.sh
RUN chmod +x /duplicity-backup.sh

ADD ./s3cfg.sh /etc/my_init.d/s3cfg.sh
RUN chmod +x /etc/my_init.d/s3cfg.sh

ADD ./start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /var/log/duplicity \
    && ln -sf /dev/stdout /var/log/duplicity/backup.log

VOLUME /var/backup

ENTRYPOINT ["/start.sh"]
