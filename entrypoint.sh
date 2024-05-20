#!/bin/sh

if [ x$4 != 'x' ]; then
  gcloud auth activate-service-account --key-file /dev/stdin <<<"$4"
fi

gcloud config set artifacts/repository "$1"
gcloud config set artifacts/location "$2"

if [ -d /github/workspace ]; then
  for i in "$3"; do
    gcloud artifacts yum upload --source=$i
  done
fi
