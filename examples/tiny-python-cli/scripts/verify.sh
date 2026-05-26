#!/usr/bin/env sh
set -eu

export PYTHONDONTWRITEBYTECODE=1
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
"$SCRIPT_DIR/check.sh"
PYTHONPATH=src python -m tiny_issues.cli
