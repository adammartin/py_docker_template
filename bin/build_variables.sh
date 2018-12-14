#!/usr/bin/env bash
set -e

set_dirs () {
    export BUILD_SCRIPTS_DIR="$(pwd)"
    export BUILD_LIB_DIR="$BUILD_SCRIPTS_DIR/build_lib"
    export PROJECT_DIR="$BUILD_SCRIPTS_DIR/.."
    export ACCEPTANCE_TEST_DIR="$PROJECT_DIR/acceptance-tests"
    export APPLICATION_DIR="$PROJECT_DIR/app"
}

set_dirs

export MIN_COVERAGE_PERCENTAGE=0
export BASE_IMAGE=
export DOCKER_REPO=
export PROJECT_NAME=
export CONTAINER_NAME="$DOCKER_REPO/$PROJECT_NAME"

if [ -z "$BASE_IMAGE" ]; then
  echo "ERROR: You must set BASE_IMAGE in bin/build_variables.sh to the desired base docker image you are building on." 1>&2
  exit 64
fi

if [ -z "$DOCKER_REPO" ]; then
  echo "ERROR: You must set DOCKER_REPO in bin/build_variables.sh to the desired base docker repo you will push to." 1>&2
  exit 64
fi

if [ -z "$PROJECT_NAME" ]; then
  echo "ERROR: You must set PROJECT_NAME in bin/build_variables.sh to the desired base docker image name you are building." 1>&2
  exit 64
fi
