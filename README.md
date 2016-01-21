Docker container for backup data [![Build Status](https://travis-ci.org/lagun4ik/docker-backup.svg?branch=master)](https://travis-ci.org/lagun4ik/docker-backup)
-------------

## Start

Create `duplicity-backup.conf` from `duplicity-backup/duplicity-backup.conf.example`

```bash
curl https://raw.githubusercontent.com/lagun4ik/docker-backup/master/duplicity-backup/duplicity-backup.conf.example -o duplicity-backup.conf
```

Change the settings in `duplicity-backup.conf` and add task to cron

```bash
docker run --rm -d --privileged \
  -v ./duplicity-backup.conf:/duplicity-backup.conf \
  -v BACKUP_DATA:/var/backup \
  -e AWS_ACCESS_KEY_ID=AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=AWS_SECRET_ACCESS_KEY \
  --name backup \
  lagun4ik/docker-backup \
  bash -c "/duplicity-backup.sh --config /duplicity-backup.conf --backup"
```

Add `-e GPG_PASSPHRASE=12345` for encrypt files (only for S3).
