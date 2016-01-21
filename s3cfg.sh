#!/usr/bin/env bash

{
  echo '[default]';
  echo 'access_key=$AWS_ACCESS_KEY';
  echo 'secret_key=$AWS_SECRET_KEY';
} > ~/.s3cfg
