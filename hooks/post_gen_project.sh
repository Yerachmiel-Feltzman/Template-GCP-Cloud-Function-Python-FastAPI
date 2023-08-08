#!/bin/bash
set -e # exit on first error encountered

poetry add --no-interaction "fastapi" "uvicorn[standard]"
poetry add --no-interaction -G dev "pytest"

chmod +X ./commands.sh
