#!/usr/bin/env bash

usage() {
  echo "Usage: $0 S3_BUCKET"
  exit 1
}
[ -z "$1" ] && usage

s3_bucket="$1"

rm -rf sam /tmp/packaged.yaml
aws s3 rb s3://"$s3_bucket" --force
