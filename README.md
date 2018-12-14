# Project template for a python docker project

This project is intended as an initial template for composing dockerized project with all the base requirements we would like to see baked in.

## Getting Started

1. Clone the project
2. Execute the following command at root of project to reset git and make it your project `rm -rf .git && git init`
3. Edit the file `bin/build_variables.sh`
4. Update the settings below to your desired values (and you are cooking with fire!):

```
export MIN_COVERAGE_PERCENTAGE=0
export BASE_IMAGE=[REPLACE_ME_WITH_IMAGE_YOU_WANT_AS_BASE]
export DOCKER_REPO=[DOCKER_REPO_YOU_WILL_COMMIT_TO]
export PROJECT_NAME=[YOUR_PROJECT_USED_TO_NAME_IMAGE]
```

### Prerequisites

* Docker host

#### Production requirements

<Pending>

#### Local development requirements

Requires:
* Docker
* Bash for shell execution
* RVM to manage Ruby (Acceptance Tests in Cucumber)
* Ruby version 2.5.1 (Acceptance Tests in Cucumber)
* pyenv to manage which python version you are managing for local development and build activities (default is python 3.6.3)

### Building

<Pending>

### Running the Tests

<Pending>

### Deployment

Babelfish is a docker managed application.  Execute `bin/build.sh` in order to build the application.
