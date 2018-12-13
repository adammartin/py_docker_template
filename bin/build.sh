#!/usr/bin/env bash
set -e

cd "${0%/*}"

. "build_variables.sh"

cd $PROJECT_DIR

"$BUILD_SCRIPTS_DIR/analyze_and_test.sh"

# Capture image_id so we can leverage it for execution and tagging purposes.
export IMAGE_ID=$(docker build --build-arg base_image=$BASE_IMAGE\
  -t $CONTAINER_NAME . 2>/dev/null | awk '/Successfully built/{print $NF}')

"$BUILD_SCRIPTS_DIR/run_acceptance_tests.sh"
