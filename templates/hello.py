#!/usr/bin/env python3

import subprocess
import os
import yaml
import json

S3_BUCKET = 'alexharvey3118'

def sceptre_handler(sceptre_user_data):
    os.chdir('sam')
    build = "sam build"
    package = "sam package --s3-bucket %s \
--output-template-file /tmp/packaged.yaml" % S3_BUCKET
    subprocess.run(build.split(" "))
    subprocess.run(package.split(" "))
    stream = open('/tmp/packaged.yaml', 'r')
    with open('/tmp/packaged.yaml') as f:
        return json.dumps(yaml.load(f, Loader=yaml.FullLoader))

if __name__ == '__main__':
    print(sceptre_handler('dummy'))
