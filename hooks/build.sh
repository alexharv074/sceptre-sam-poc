#!/usr/bin/env bash

usage() {
  echo "Usage: $0 S3_BUCKET URL"
  exit 1
}
[ -z "$1" ] && usage

s3_bucket="$1"
url="$2"

aws s3 mb s3://"$s3_bucket"
mkdir -p sam ; cd sam

wget "$url" -O sam.zip
unzip sam.zip

sam build || exit "$?"

sam package \
  --s3-bucket "$s3_bucket" \
  --output-template-file '/tmp/packaged.yaml'
