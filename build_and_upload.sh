#!/bin/bash

set -e
set -x

version=$(git describe --tags --abbrev=0)
poetry version "${version}"
poetry build $INPUT_POETRY_BUILD_ARGS
poetry publish --dry-run -u "$INPUT_PYPI_USERNAME" -p "$INPUT_PYPI_PASSWORD" # Remove --dry-run when ready to run actual publishing
