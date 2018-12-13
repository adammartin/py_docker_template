#!/usr/bin/env bash
set -e

cd "${0%/*}"

. "build_variables.sh"

source ~/.rvm/scripts/rvm
# set working directory to directory of this script
cd "$ACCEPTANCE_TEST_DIR"
# verify bundler is installed for dependency management
if ! gem list '^bundler$' -i; then gem install bundler; fi

# install dependencies, this is idempotent
bundle install

bundle exec cucumber -f pretty -f json -o cucumber.json
