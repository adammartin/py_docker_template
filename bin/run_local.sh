#!/usr/bin/env bash
set -e

cd "${0%/*}"

. "build_variables.sh"

# docker run -ti -v "$PROJECT_DIR/app":/app "$CONTAINER_NAME":latest /bin/bash
docker run -i -p 80:80 "$CONTAINER_NAME":latest
