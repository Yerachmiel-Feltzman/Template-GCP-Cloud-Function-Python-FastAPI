# {{cookiecutter.project_name}}

{{cookiecutter.project_description}}

## Develop

### Setting up local env

**Must have:**

1. [Poetry](https://python-poetry.org/) (Using version {{ cookiecutter.poetry_version}}. Check yours
   with `poetry --version`.)
2. Python >= 3.11 (best set with Pyenv, since local python version will be inferred
   from `[.python-version](.python-version)`)

**Optional:**

1. Docker - if you want to test image build
2. Google cloud CLI - if you want to test deployment
3. Google cloud local authentication - if you want to connect to BigQuery from your local machine

### Deployment commands

Currently, all deployment commands are under `./commands.sh <COMMAND>`.
For example, `./commands.sh gcp:cloud_run:deploy()` will deploy the cloud run service based on the
project [Dockerfile](Dockerfile).
Please see the `./commands.sh` script for other deployment methods.

_Note:_ all commands deploy on one single environment currently. See [TODOs](#todos-) for other to-be-implemented
features.

# TODOs:

- update deploying (using gitlab-ci, either with terraform or chaining `./commands.sh <COMMAND>`)
- deploy on different envs depending on branch
