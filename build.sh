#!/bin/bash -x

set -e

rm -rf layer
docker build -t pandas-lambda-layer .
CONTAINER=$(docker run -d pandas-lambda-layer false)
docker cp $CONTAINER:/opt layer
docker rm $CONTAINER
touch layer/.slsignore
cat > layer/.slsignore << EOF
**/*.a
**/*.la
share/**
include/**
bin/**
EOF