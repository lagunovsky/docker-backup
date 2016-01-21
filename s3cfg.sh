#!/usr/bin/env bash

if [ -n "$AWS_ACCESS_KEY_ID" ]
then

  {
    echo '[default]';
    echo "access_key=$AWS_ACCESS_KEY_ID";
    echo "secret_key=$AWS_SECRET_ACCESS_KEY";
  } > ~/.s3cfg

  if [ -n "$AWS_LOCATION" ]
  then
    echo "bucket_location = $AWS_LOCATION" >> ~/.s3cfg
  fi

fi
