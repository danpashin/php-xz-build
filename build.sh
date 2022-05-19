#!/bin/bash

docker build -t php-xz:build . -f Dockerfile.build

docker container create --name  php-xz-extract php-xz:build
docker container cp php-xz-extract:/php-ext-xz/modules/xz.so .
docker container rm -f php-xz-extract
docker image rm php-xz:build
