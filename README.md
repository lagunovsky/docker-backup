Docker container for incremental, encrypted backups (Amazon S3, Google Cloud Storage, FTP, SFTP, SCP, rsync, file...). [![Build Status](https://travis-ci.org/lagun4ik/docker-backup.svg?branch=master)](https://travis-ci.org/lagun4ik/docker-backup)
-------------

This container based on [duplicity-backup.sh](https://github.com/zertrin/duplicity-backup).

## Create and change configuration file

```bash
curl https://raw.githubusercontent.com/lagun4ik/docker-backup/master/duplicity-backup/duplicity-backup.conf.example -o duplicity-backup.conf
```

## Use docker-compose
```yml
version: '2'

services:
  backup:
    image: lagun4ik/docker-backup
    privileged: true
    restart: always
    volumes:
      - :/duplicity-backup.conf
      - :/var/backup
    environment:
      - CRON_SCHEDULE=0 1 * * *
```

## Environment variables for AWS
```yml
  - AWS_ACCESS_KEY_ID=
  - AWS_SECRET_ACCESS_KEY=
  - AWS_LOCATION=
```
