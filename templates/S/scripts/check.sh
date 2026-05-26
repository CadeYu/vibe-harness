#!/usr/bin/env sh
set -eu

echo "==> Running minimal harness check"

if [ -f package.json ] && command -v npm >/dev/null 2>&1; then
  npm test --if-present
fi

if [ -f pyproject.toml ] && command -v pytest >/dev/null 2>&1; then
  pytest
fi

if [ -f go.mod ] && command -v go >/dev/null 2>&1; then
  go test ./...
fi

if [ -f Cargo.toml ] && command -v cargo >/dev/null 2>&1; then
  cargo test
fi

echo "==> Minimal harness check complete"

