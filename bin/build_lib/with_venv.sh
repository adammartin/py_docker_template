#!/usr/bin/env bash

set_venv () {
    echo "TODO: Fix https://github.com/pypa/pip/issues/1773 problem for TeamCity in bin/build_lib/with_venv.sh"
    if [[ -z "${#JENKINS_URL}" ]]; then
        # Avoid long paths that lead to issues running pip in virtualenv
        # https://github.com/pypa/pip/issues/1773
        export VENV="$(mktemp -d "/tmp/venv.XXXXXXXX")"
    else
        export VENV="$PROJECT_DIR/venv/$PROJECT_NAME"
    fi

    if [[ ! -d "$VENV" ]]; then
        echo "Creating virtual environment $VENV"
        python -m venv $VENV
    fi
}

with_venv () {
    . "$VENV/bin/activate"
}

activate_build_venv () {
  with_venv
  pip install --upgrade pip > /dev/null
  pip install -r "$PROJECT_DIR/build_requirements.txt" > /dev/null
}

if [[ ! -z "${#VENV}" ]]; then
    set_venv
fi
