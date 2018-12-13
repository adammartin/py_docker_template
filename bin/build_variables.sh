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

export DOCKER_REPO="ebondark"
export PROJECT_NAME="babelfish"
export CONTAINER_NAME="$DOCKER_REPO/$PROJECT_NAME"
export BASE_IMAGE="ebondark/babelfish-base"
export MIN_COVERAGE_PERCENTAGE=0
