#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ROOT_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

cd "$ROOT_DIR"

sh "$SCRIPT_DIR/check-consistency.sh"
sh "$SCRIPT_DIR/validate-feature-list.sh" .

echo "==> Framework fast checks complete"
