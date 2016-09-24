#!/bin/bash

set -e

CRON_SCHEDULE=${CRON_SCHEDULE:-0 1 * * *}

if [ -n "$DEST_WEBDAV_S" ]
then
    sed -i 's|#DEST="webdav[s]://user[:password]@other.host[:port]/some_dir"|DEST="webdav[s]://'"$DEST_WEBDAV_S"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_IMAP_S" ]
then
    sed -i 's|#DEST="imap[s]://user[:password]@host.com[/from_address_prefix]"|DEST="'"$DEST_IMAP_S"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_FILE" ]
then
    sed -i 's|#DEST="file:///home/foobar_user_name/new-backup-test/"|DEST="file://'"$DEST_FILE"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_SCP" ]
then
    sed -i 's|#DEST="scp://user[:password]@other.host[:port]/[/]some_dir"|DEST="scp://'"$DEST_SCP"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_SSH" ]
then
    sed -i 's|#DEST="ssh://user[:password]@other.host[:port]/[/]some_dir"|DEST="ssh://'"$DEST_SSH"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_SFTP" ]
then
    sed -i 's|#DEST="sftp://user[:password]@other.host[:port]/[/]some_dir"|DEST="sftp://'"$DEST_SFTP"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_RSYNC" ]
then
    sed -i 's|#DEST="rsync://user@host.com[:port]//absolute_path"|#DEST="rsync://'"$DEST_RSYNC"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_FTP" ]
then
    sed -i 's|#DEST="ftp://user[:password]@other.host[:port]/some_dir"|DEST="ftp://'"$DEST_FTP"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_FTPS" ]
then
    sed -i 's|#DEST="ftps://user[:password]@other.host[:port]/some_dir"|DEST="ftps://'"$DEST_FTPS"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_FTPES" ]
then
    sed -i 's|#DEST="ftpes://user[:password]@other.host[:port]/some_dir"|DEST="ftpes://'"$DEST_FTPES"'"|g' /duplicity-backup.conf
fi

if [ -n "$EXCLIST" ]
then
    sed -i 's|#DEST="EXCLIST=( "/home/foobar_user_name/Documents/foobar-to-exclude" )|EXCLIST=( '"$EXCLIST"' )|g' /duplicity-backup.conf
fi

if [ -n "$EMAIL_TO" ]
then
    sed -i 's|EMAIL_TO=|EMAIL_TO="'"$EMAIL_TO"'"|g' /duplicity-backup.conf
    sed -i 's|EMAIL_FROM=|EMAIL_FROM="'"$EMAIL_FROM"'"|g' /duplicity-backup.conf
    sed -i 's|EMAIL_SUBJECT=|EMAIL_SUBJECT="'"$EMAIL_SUBJECT"'"|g' /duplicity-backup.conf
    sed -i 's|EMAIL_FAILURE_ONLY="yes"|EMAIL_FAILURE_ONLY="'"$EMAIL_SUBJECT"'"|g' /duplicity-backup.conf
fi

if [ -n "$NOTIFICATION_SERVICE" ]
then
    sed -i 's|NOTIFICATION_SERVICE=""|NOTIFICATION_SERVICE="'"$NOTIFICATION_SERVICE"'"|g' /duplicity-backup.conf
    sed -i 's|NOTIFICATION_FAILURE_ONLY="yes"|NOTIFICATION_FAILURE_ONLY="'"$NOTIFICATION_FAILURE_ONLY"'"|g' /duplicity-backup.conf
fi

if [ -n "$SLACK_HOOK_URL" ]
then
    sed -i 's|https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX|'"$SLACK_HOOK_URL"'|g' /duplicity-backup.conf
    sed -i 's|SLACK_CHANNEL="#general"|SLACK_CHANNEL="'"$SLACK_CHANNEL"'"|g' /duplicity-backup.conf
    sed -i 's|SLACK_USERNAME="duplicity-backup"|SLACK_USERNAME="'"$SLACK_USERNAME"'"|g' /duplicity-backup.conf
    sed -i 's|SLACK_EMOJI="${SLACK_EMOJI}"|SLACK_EMOJI="'"$SLACK_EMOJI"'"|g' /duplicity-backup.conf
fi

if [ -n "$IFTTT_KEY" ]
then
    sed -i 's|IFTTT_KEY=""|IFTTT_KEY="'"$IFTTT_KEY"'"|g' /duplicity-backup.conf
    sed -i 's|IFTTT_MAKER_EVENT="duplicity"|IFTTT_MAKER_EVENT="'"$IFTTT_MAKER_EVENT"'"|g' /duplicity-backup.conf
    sed -i 's|IFTTT_HOOK_URL="https://maker.ifttt.com/trigger/$IFTTT_MAKER_EVENT/with/key/$IFTTT_KEY"|IFTTT_HOOK_URL="'"$IFTTT_HOOK_URL"'"|g' /duplicity-backup.conf
    sed -i 's|IFTTT_VALUE2=""|IFTTT_VALUE2="'"$IFTTT_VALUE2"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_S3" ]
then
    sed -i 's|#DEST="s3+http://foobar-backup-bucket/backup-folder/"|DEST="s3+http://'"$DEST_S3"'"|g' /duplicity-backup.conf
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
fi

if [ -n "$DEST_SWIFT" ]
then
    sed -i 's|#DEST="swift://foobar_swift_container/some_dir"|DEST="swift://'"$DEST_SWIFT"'"|g' /duplicity-backup.conf
    sed -i 's|#SWIFT_USERNAME="foobar_swift_tenant:foobar_swift_username"|SWIFT_USERNAME="'"$SWIFT_USERNAME"'"|g' /duplicity-backup.conf
    sed -i 's|#SWIFT_PASSWORD="foobar_swift_password"|SWIFT_PASSWORD="'"$SWIFT_PASSWORD"'"|g' /duplicity-backup.conf
    sed -i 's|#SWIFT_AUTHURL="foobar_swift_authurl"|SWIFT_AUTHURL="'"$SWIFT_AUTHURL"'"|g' /duplicity-backup.conf
    sed -i 's|#SWIFT_AUTHVERSION="2"|SWIFT_AUTHVERSION="'"$SWIFT_AUTHVERSION"'"|g' /duplicity-backup.conf
fi

if [ -n "$DEST_GS" ]
then
    sed -i 's|#DEST="gs://foobar-backup-bucket/backup-folder/"|DEST="gs://'"$DEST_GS"'"|g' /duplicity-backup.conf
    sed -i 's|#GS_ACCESS_KEY_ID="foobar_gcs_key_id"|GS_ACCESS_KEY_ID="'"$GS_ACCESS_KEY_ID"'"|g' /duplicity-backup.conf
    sed -i 's|#GS_SECRET_ACCESS_KEY="foobar_gcs_secret_id"|GS_ACCESS_KEY_ID="'"$GS_SECRET_ACCESS_KEY"'"|g' /duplicity-backup.conf
fi

if [[ "$1" == 'no-cron' ]]; then
        exec /duplicity-backup.sh --backup
else
        LOGFIFO='/var/log/cron.fifo'
        if [[ ! -e "$LOGFIFO" ]]; then
                mkfifo "$LOGFIFO"
        fi
        echo -e "$CRON_SCHEDULE cd /var/backup; /duplicity-backup.sh --backup > $LOGFIFO 2>&1" | crontab -
        crontab -l
        cron
        tail -f "$LOGFIFO"
fi
