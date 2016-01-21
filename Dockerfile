FROM ubuntu

MAINTAINER ivan@lagunovsky.com

ENV TERM "xterm"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y duplicity ca-certificates s3cmd

RUN apt-get install -y --no-install-recommends haveged apg python-boto python-paramiko s3cmd

ADD /duplicity-backup/duplicity-backup.sh /duplicity-backup.sh

VOLUME /var/backup

ADD ./s3cfg.sh /s3cfg.sh
ENTRYPOINT ["/s3cfg.sh"]
