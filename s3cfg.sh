#!/usr/bin/env bash

{
  echo '[default]';
  echo 'access_key=$AWS_ACCESS_KEY_ID';
  echo 'secret_key=$AWS_SECRET_ACCESS_KEY';
} > ~/.s3cfg
