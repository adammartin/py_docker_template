#!/usr/bin/env bash
set -e

docker run -ti -v "$PWD/app":/app babelfish:latest /bin/bash
