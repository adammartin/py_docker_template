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
export VERSION=[VERSION_OF_IMAGE]
export PROJECT_NAME=[YOUR_PROJECT_USED_TO_NAME_IMAGE]
# DEPLOY ONLY
export CERT_PROVIDER=[letsencrypt-prod|letsencrypt-staging]
export HOST_URL=[KUBERNETES_HOST_URL]
export ROUTE=[ROUTE_ON_KUBERNETES_CLUSTER]
export SECRET_NAME=[CREDENTIAL_NAME_ABLE_TO_ACESS_PRIVATE_REPO]
```

* **BASE_IMAGE:** This is the base image you are going to use for your project.  An example might be `tiangolo/uwsgi-nginx-flask:python3.6`.  It is expected this image contains flask by default.  The container must have the following:

   * Python 3 or better
   * Flask
   * A mechanism to bind traffic to port 80 (you can do others but you'll have to configure it) [Example: ]

* **DOCKER_REPO:** This is YOUR repository you will be pushing to.
* **PROJECT_NAME:** This is what you want to call your new container.
* **VERSION:** Docker image version (ex. v1.0) that the image is tagged with.
* **MIN_COVERAGE_PERCENTAGE:** This is the setting that changes the percentage of code coverage to fail the build.  Currently it is set to 0% so we do not fail the build ever unless a test fails.  We recommend 90% as a starting point.
* **CERT_PROVIDER:** (DEPLOY ONLY) Which lets encrypt provider to use for certs [letsencrypt-prod|letsencrypt-staging].
* **HOST_URL:** (DEPLOY ONLY) Kubernetes host to deploy to.
* **ROUTE:** (DEPLOY ONLY) Route in the kubernetes from root ('/')
* **SECRET_NAME:** (DEPLOY ONLY) Kubernetes cluster secret name that has the credentials necessary to connect to the private container registry source.

For deployment if you are pulling from a private repository there are two additional settings you likely need to adjust in the `bin/build_variables.sh` file that are commented out and one that is not.

```
# export REPO_SERVER=[PRIVATE REPOSITORY SERVER]
# export TAG="$REPO_SERVER/$DOCKER_REPO/$PROJECT_NAME:$VERSION"
export TAG="$DOCKER_REPO/$PROJECT_NAME:$VERSION"
```

Simply uncomment and populate REP_SERVER, uncomment the `TAG` line that references it, and delete or comment out the old `export TAG="$DOCKER_REPO/$PROJECT_NAME:$VERSION"`.  This will allow the deploy script to operate.

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
