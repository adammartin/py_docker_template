#!/usr/bin/env bash
set -e

cd "${0%/*}"

. "build_variables.sh"

. "$BUILD_LIB_DIR/common.sh"
. "$BUILD_LIB_DIR/with_venv.sh"

activate_build_venv

with_venv
pushd_silent "$PROJECT_DIR"
echo "Running pytest"
pytest --cov="$APPLICATION_DIR" --junit-xml="test_results.xml"
echo "Generating coverage report"
coverage xml
coverage report --fail-under "$MIN_COVERAGE_PERCENTAGE" --skip-covered
popd_silent
