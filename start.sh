#!/bin/bash

set -e

: ${AWS_ACCESS_KEY_ID:?"AWS_ACCESS_KEY_ID env variable is required"}
: ${AWS_SECRET_ACCESS_KEY:?"AWS_SECRET_ACCESS_KEY env variable is required"}

CRON_SCHEDULE=${CRON_SCHEDULE:-0 1 * * *}

{
  echo '[default]';
  echo "access_key=$AWS_ACCESS_KEY_ID";
  echo "secret_key=$AWS_SECRET_ACCESS_KEY";
  echo "default_mime_type = binary/octet-stream"
} > ~/.s3cfg

if [ -n "$GPG_PASSPHRASE" ]
then
  echo "gpg_command = /usr/bin/gpg" >> ~/.s3cfg
  echo "gpg_passphrase = $GPG_PASSPHRASE" >> ~/.s3cfg
fi

if [ -n "$AWS_LOCATION" ]
then
  echo "bucket_location=$AWS_LOCATION" >> ~/.s3cfg
fi

if [[ "$1" == 'no-cron' ]]; then
    exec /duplicity-backup.sh --backup
else
    LOGFIFO='/var/log/cron.fifo'
    if [[ ! -e "$LOGFIFO" ]]; then
        mkfifo "$LOGFIFO"
    fi
    echo -e "$CRON_SCHEDULE /duplicity-backup.sh --backup > $LOGFIFO 2>&1" | crontab -
    crontab -l
    cron
    tail -f "$LOGFIFO"
fi
