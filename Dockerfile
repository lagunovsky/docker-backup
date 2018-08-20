FROM alpine:3.8

MAINTAINER ivan@lagunovsky.com

RUN apk add --update \
    python \
    py-pip \
    py-cffi \
    py-cryptography \
    py-openssl \
    py-boto \
    mailx \
    bash \
    duplicity \
    ca-certificates \
  && pip install --upgrade pip \
  && apk add --virtual build-deps \
    gcc \
    libffi-dev \
    python-dev \
    linux-headers \
    musl-dev \
    openssl-dev \
  && pip install gsutil \
  && pip install s3cmd \
  && apk del build-deps \
  && rm -rf /var/cache/apk/*

COPY ./duplicity-backup /duplicity-backup
COPY ./scripts /scripts

RUN mkfifo /var/log/cron.fifo \
    && chmod +x /scripts/entrypoint.sh \
    && chmod +x /duplicity-backup/duplicity-backup.sh

ENTRYPOINT ["/scripts/entrypoint.sh"]
