#!/usr/bin/env bash
set -e

cd "${0%/*}"

. "build_variables.sh"

cd $PROJECT_DIR

"$BUILD_SCRIPTS_DIR/analyze_python.sh"
"$BUILD_SCRIPTS_DIR/run_unit_tests.sh"
