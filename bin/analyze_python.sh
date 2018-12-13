#!/usr/bin/env bash
set -e

cd "${0%/*}"

. "build_variables.sh"

. "$BUILD_LIB_DIR/common.sh"
. "$BUILD_LIB_DIR/with_venv.sh"

activate_build_venv

run_pylint () {
    pylint --rcfile=.pylintrc "app"
}

with_venv
pushd_silent "$PROJECT_DIR"
echo "Running pylint"
run_pylint
echo "Running flake8"
flake8 "$APPLICATION_DIR"
echo "Running bandit"
bandit -r "$APPLICATION_DIR"
popd_silent
