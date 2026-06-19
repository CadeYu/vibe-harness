#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ROOT_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

cd "$ROOT_DIR"

"$SCRIPT_DIR/check.sh"
sh tests/test_audit.sh
sh tests/test_install.sh
sh tests/test_consistency.sh
sh tests/test_feature_list.sh

echo "==> Framework full verification complete"
