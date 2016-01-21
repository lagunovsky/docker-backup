FROM phusion/baseimage

MAINTAINER ivan@lagunovsky.com

ENV TERM "xterm"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y duplicity ca-certificates s3cmd

RUN apt-get install -y --no-install-recommends \
    haveged apg python-boto python-paramiko s3cmd

ADD /duplicity-backup/duplicity-backup.sh /duplicity-backup.sh

VOLUME /var/backup

ADD ./s3cfg.sh /etc/my_init.d/s3cfg.sh
