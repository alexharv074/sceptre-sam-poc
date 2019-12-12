#!/usr/bin/env bash

if ! which -s sam ; then
  echo "sam not found. Try . venv/bin/activate"
  exit 1
fi

s3_bucket='alexharvey3118'

(cd sam && \
  sam build && \
  sam package \
    --output-template-file 'packaged.yaml' \
    --s3-bucket "$s3_bucket")

(cd sam && zip -r9 ../sam.zip *)
