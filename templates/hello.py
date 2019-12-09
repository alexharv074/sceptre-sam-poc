#!/usr/bin/env python3

import subprocess
import os
import yaml
import json

def sceptre_handler(sceptre_user_data):
    os.chdir('sam')
    subprocess.run(['sam', 'build'])
    subprocess.run(['sam', 'package',
        '--s3-bucket', 'alexharvey3118',
        '--output-template-file', '/tmp/packaged.yaml'])
    stream = open('/tmp/packaged.yaml', 'r')
    with open('/tmp/packaged.yaml') as f:
        return json.dumps(yaml.load(f, Loader=yaml.FullLoader))

if __name__ == '__main__':
    print(sceptre_handler('foo'))
