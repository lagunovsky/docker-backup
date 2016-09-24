Docker container for incremental, encrypted backups (Amazon S3, Google Cloud Storage, FTP, SFTP, SCP, rsync, file...). [![Build Status](https://travis-ci.org/lagun4ik/docker-backup.svg?branch=master)](https://travis-ci.org/lagun4ik/docker-backup)
-------------

This container based on [duplicity-backup](https://github.com/zertrin/duplicity-backup)

# Configuring
* [Exclude list of directories](#exclude-list-of-directories)
* Notifications
  * [IFTTT](#IFTTT)
  * [Slack](#Slack)
  * [Mail](#Mail)
* [S3](#s3)
* [Google Cloud storage](#google-cloud-storage)
* [Openstack object storage](#openstack-object-storage)
* [FTP](#ftp)
* [FTPS](#ftps)
* [FTPES](#ftpes)
* [RSYNC](#rsync)
* [SCP](#scp)
* [SSH](#ssh)
* [SFTP](#sftp)
* [FILE](#file)
* [IMAP[s]](#imap_s)
* [WEBDAV[s]](#webdav_s)
* [GDOCS](#gdocs)


## Use docker-compose
```yml
version: '2'

services:
  backup:
    image: lagun4ik/docker-backup
    privileged: true
    restart: always
    volumes:
      - :/var/backup
    environment:
      - CRON_SCHEDULE=0 1 * * *
```

## Exclude list of directories
```yml
  - EXCLUDE="/var/backup/*/Trash /var/backup/**.DS_Store"
```

## Notifications
```yml
  - NOTIFICATION_SERVICE="" # Possible values for NOTIFICATION_SERVICE are slack, ifttt
  - NOTIFICATION_FAILURE_ONLY="yes"
```

### IFTTT
```yml
  - IFTTT_KEY="" # Key for MAKER channel at IFTTT
  - IFTTT_MAKER_EVENT="duplicity" # name the event to trigger at IFTTT Maker Channel
  - IFTTT_VALUE2="" # general purpose value to pass to your maker channel (optional)
```

### Slack
```yml
  - SLACK_HOOK_URL=
  - SLACK_CHANNEL=
  - SLACK_USERNAME=
  - SLACK_EMOJI=
```

### Mail
```yml
  - EMAIL_TO=
  - EMAIL_FROM=
  - EMAIL_SUBJECT=
  - EMAIL_FAILURE_ONLY="yes"
```

## S3
```yml
  - DEST_S3=foobar-backup-bucket/backup-folder/
  - AWS_ACCESS_KEY_ID=
  - AWS_SECRET_ACCESS_KEY=
  - AWS_LOCATION=
```

## GOOGLE CLOUD STORAGE
```yml
  - DEST_GS=foobar-backup-bucket/backup-folder/
  - GS_ACCESS_KEY_ID=
  - GS_SECRET_ACCESS_KEY=
```

## GDOCS
```yml
  - GDOCS=foobar_google_account/some_dir
```


## OPENSTACK OBJECT STORAGE
```yml
  - DEST_SWIFT=foobar_swift_container/some_dir
  - SWIFT_USERNAME=foobar_swift_tenant:foobar_swift_username
  - SWIFT_PASSWORD=
  - SWIFT_AUTHURL=
  - SWIFT_AUTHVERSION=
```

## FTP
```yml
  - DEST_FTP=user[:password]@other.host[:port]/some_dir
```

## FTPS
```yml
  - DEST_FTPS=user[:password]@other.host[:port]/some_dir
```

## FTPES
```yml
  - DEST_FTPES=user[:password]@other.host[:port]/some_dir
```

## RSYNC
```yml
  - DEST_RSYNC=user@host.com[:port]//absolute_path
```

## SCP
```yml
  - DEST_SCP=user[:password]@other.host[:port]/[/]some_dir
```

## SSH
```yml
  - DEST_SSH=user[:password]@other.host[:port]/[/]some_dir
```

## SFTP
```yml
  - DEST_SFTP=user[:password]@other.host[:port]/[/]some_dir
```

## FILE
```yml
  - DEST_FILE=/home/foobar_user_name/new-backup-test/
```

## IMAP_S
```yml
  - DEST_IMAP_S=user[:password]@host.com[/from_address_prefix]
```

## WEBDAV_s
```yml
  - DEST_WEBDAV_s=user[:password]@other.host[:port]/some_dir
```
