#!/usr/bin/env bash
set -e

source ~/.rvm/scripts/rvm
# set working directory to directory of this script
cd "${0%/*}"
# verify bundler is installed for dependency management
if ! gem list '^bundler$' -i; then gem install bundler; fi

# install dependencies, this is idempotent
bundle install

bundle exec cucumber -f pretty -f json -o cucumber.json
