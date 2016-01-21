FROM ubuntu

MAINTAINER ivan@lagunovsky.com

ENV TERM "xterm"

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y duplicity ca-certificates s3cmd

RUN apt-get install -y --no-install-recommends haveged apg python-boto python-paramiko s3cmd

RUN { \
		echo '[default]'; \
		echo 'access_key=$AWS_ACCESS_KEY'; \
		echo 'secret_key=$AWS_SECRET_KEY'; \
	} > ~/.s3cfg


ADD /duplicity-backup/duplicity-backup.sh /duplicity-backup.sh

VOLUME /var/backup
