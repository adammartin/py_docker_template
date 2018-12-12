#!/usr/bin/env bash
set -e

set_dirs () {
    export BUILD_SCRIPTS_DIR="$(pwd)"
    export PROJECT_DIR="$BUILD_SCRIPTS_DIR/.."
    export ACCEPTANCE_TEST_DIR="$PROJECT_DIR/acceptance-tests"
}

set_dirs

export DOCKER_REPO="ebondark"
export PROJECT_NAME="babelfish"
export CONTAINER_NAME="$DOCKER_REPO/$PROJECT_NAME"
export BASE_IMAGE="ebondark/babelfish-base"
