#!/usr/bin/env bash

usage() {
  echo "Usage: . $0 [-h]"
  exit 1
}
[ "$1" == "-h" ] && usage
[ "$0" == "${BASH_SOURCE[0]}" ] && usage

virtualenv venv
. venv/bin/activate

pip install -r requirements.txt
