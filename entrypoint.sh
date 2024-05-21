#!/bin/bash

if [ x$5 != 'x' ]; then
  gcloud auth activate-service-account --key-file "$5"
fi

gcloud config set core/project "$1"
gcloud config set artifacts/repository "$2"
gcloud config set artifacts/location "$3"

if [ -d /github/workspace ]; then
  read -a PKGS <<< "$4"
  for i in "${PKGS[@]}"; do
    find /github/workspace -name "$(echo $i | xargs echo -n)" -exec gcloud artifacts yum upload --source={} \;
  done
fi
