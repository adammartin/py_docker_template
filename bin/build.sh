#!/usr/bin/env bash
set -e

cd "${0%/*}"

. "build_variables.sh"

cd $PROJECT_DIR

export IMAGE_ID=$(docker build -t $CONTAINER_NAME . 2>/dev/null | awk '/Successfully built/{print $NF}')

"$BUILD_SCRIPTS_DIR/run_tests.sh"
