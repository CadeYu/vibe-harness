#!/usr/bin/env sh
set -eu

echo "==> Running full verification"

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
"$SCRIPT_DIR/check.sh"

if [ -f package.json ] && command -v npm >/dev/null 2>&1; then
  npm run build --if-present
fi

if [ -f pyproject.toml ] && command -v python >/dev/null 2>&1; then
  python -m compileall .
fi

if [ -f go.mod ] && command -v go >/dev/null 2>&1; then
  go vet ./...
fi

if [ -f Cargo.toml ] && command -v cargo >/dev/null 2>&1; then
  cargo clippy --all-targets -- -D warnings
fi

echo "==> Full verification complete"

