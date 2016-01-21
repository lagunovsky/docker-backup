Docker container for backup data [![Build Status](https://travis-ci.org/lagun4ik/docker-backup.svg?branch=master)](https://travis-ci.org/lagun4ik/docker-backup)
-------------

## Start

Create `duplicity-backup.conf` from `duplicity-backup/duplicity-backup.conf.example`

```bash
cp duplicity-backup/duplicity-backup.conf.example duplicity-backup.conf
```

Change the settings in `duplicity-backup.conf` and add task to cron

```bash
docker run --rm -d --privileged \
  -v BACKUP_CONF_PATCH:/duplicity-backup.conf \
  -v BACKUP_DATA:/var/backup \
  -e AWS_ACCESS_KEY=AWS_ACCESS_KEY
  -e AWS_SECRET_KEY=AWS_SECRET_KEY
  --name backup \
  lagun4ik/docker-backup \
  bash -c "/duplicity-backup.sh --config /duplicity-backup.conf --backup"
```
