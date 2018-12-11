#!/usr/bin/env bash
set -e

docker container prune -f
docker image prune --filter "label!=latest" -f
