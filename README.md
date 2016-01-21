Docker container for backup data [![Build Status](https://travis-ci.org/lagun4ik/docker-backup.svg?branch=master)](https://travis-ci.org/lagun4ik/docker-backup)
-------------

## Create configuration file

```bash
curl https://raw.githubusercontent.com/lagun4ik/docker-backup/master/duplicity-backup/duplicity-backup.conf.example -o duplicity-backup.conf
```

## Create container

Change the settings in `duplicity-backup.conf`
Add `-e GPG_PASSPHRASE=12345` for encrypt files (only for S3).

```bash
docker create --privileged \
  --cpu-shares 512
  -v PATCH_TO_CONF:/duplicity-backup.conf \
  -v BACKUP_DATA:/var/backup \
  -e AWS_ACCESS_KEY_ID=AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=AWS_SECRET_ACCESS_KEY \
  --name backup \
  lagun4ik/docker-backup \
  bash -c "/duplicity-backup.sh --backup"
```


## Creating backup (add to cron)
```bash
docker start backup
```
