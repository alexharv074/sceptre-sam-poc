# Sceptre SAM proof of concept

## Overview

This is a proof of concept showing how I set up Sceptre to manage an AWS SAM stack.

## Usage

Create the Virtualenv to install Sceptre and SAM and other dependencies:

```text
▶ . venv.sh
```

Create the S3 bucket:

```text
▶ aws s3 mb s3://alexharvey3118
```

Create the stack:

```text
▶ sceptre --dir=test create dev/hello.yaml  
```

Delete the stack:

```text
▶ sceptre --dir=test delete dev/hello.yaml
```

## License

MIT.
