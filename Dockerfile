FROM ubuntu

MAINTAINER ivan@lagunovsky.com

ENV TERM "xterm"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y duplicity ca-certificates s3cmd

ADD /duplicity-backup/duplicity-backup.sh /duplicity-backup.sh

VOLUME /var/backup
