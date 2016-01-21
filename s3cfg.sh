#!/usr/bin/env bash

if [ -n "$AWS_ACCESS_KEY_ID" ]
then

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
