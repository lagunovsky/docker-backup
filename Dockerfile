FROM ubuntu

MAINTAINER ivan@lagunovsky.com

ENV TERM "xterm"

RUN apt-get update \
    apt-get upgrade \
    && apt-get install -y duplicity

ADD /duplicity-backup/duplicity-backup.sh /duplicity-backup.sh

VOLUME /var/backup
