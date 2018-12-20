# Project template for a python docker project

This project is intended as an initial template for composing dockerized project with all the base requirements we would like to see baked in.

## Getting Started

1. Assert you have all the pre-requisites for development!
2. Clone the project ( `git clone git@github.com:adammartin/py_docker_template.git`)
3. Rename the root folder to your project name and cd into it.
4. Update `.python-version` if you do not wish to use your own python version.
5. Execute the following command at root of project to reset git and make it your project `rm -rf .git && git init`
6. Edit the file `bin/build_variables.sh`
7. Update the settings below to your desired values (and you are cooking with fire!):

```
export MIN_COVERAGE_PERCENTAGE=0
export BASE_IMAGE=[REPLACE_ME_WITH_IMAGE_YOU_WANT_AS_BASE]
export DOCKER_REPO=[DOCKER_REPO_YOU_WILL_COMMIT_TO]
export PROJECT_NAME=[YOUR_PROJECT_USED_TO_NAME_IMAGE]
```

* **BASE_IMAGE:** This is the base image you are going to use for your project.  An example might be `tiangolo/uwsgi-nginx-flask:python3.6`.  It is expected this image contains flask by default.  The container must have the following:

   * Python 3 or better
   * Flask
   * A mechanism to bind traffic to port 80 (you can do others but you'll have to configure it) [Example: ]

* **DOCKER_REPO:** This is YOUR repository you will be pushing to.
* **PROJECT_NAME:** This is what you want to call your new container.
* **MIN_COVERAGE_PERCENTAGE:** This is the setting that changes the percentage of code coverage to fail the build.  Currently it is set to 0% so we do not fail the build ever unless a test fails.  We recommend 90% as a starting point.

### Prerequisites

* Docker host
* Bash shell

#### Production requirements

* Something to deploy Docker Containers to!  (For example AKS)

#### Local development requirements

Requires:
* Docker
* Bash for shell execution
* RVM to manage Ruby (Acceptance Tests in Cucumber)
* Ruby version 2.5.1 (Acceptance Tests in Cucumber)
* pyenv to manage which python version you are managing for local development and build activities (default is python 3.6.3)
* module venv must be installed on your python version!

### Building

It is assumed you have already followed steps described in `Getting Started`.  From there you now have the following scripts at your fingertips!

* **bin/build.sh**: This script is the base script that will set up the environment, execute static analysis, execute security scan, execute unit tests, build the container, and execute acceptance tests.
* **bin/run_local.sh**: This script will execute the image with the `latest` tag.  Tailer to your needs.
* **bin/cleanup_environment.sh**: This script will clean up excess images and containers laying around that are not tagged with `latest` tag.  Tailer to your needs.
* **bin/build_variables.sh**: Variables used through out the scripts.
* **bin/run_unit_tests.sh**: This script will run the unit tests.
* **bin/analyze_python.sh**: This script will do local static analysis and security scans.
* **bin/analyze_and_test.sh**: This script will execute the tuple of `analyze_python.sh` and `run_unit_tests.sh`
* **bin/run_acceptance_tests.sh**: This script will execute the acceptance tests.  Note that if you run this outside of the `bin/build.sh` script you will need to set the `IMAGE_ID` environment variable to be passed into the acceptance tests scripts for firing up the correct image in a container.

### Running the Tests

<Pending>

### Deployment

<Pending>
