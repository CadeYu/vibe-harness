#!/usr/bin/env sh
set -eu

echo "==> Running fast checks"

if [ -f package.json ] && command -v npm >/dev/null 2>&1; then
  npm run lint --if-present
  npm run typecheck --if-present
  npm test --if-present
fi

if [ -f pyproject.toml ]; then
  if command -v ruff >/dev/null 2>&1; then
    ruff check .
  fi
  if command -v pytest >/dev/null 2>&1; then
    pytest
  fi
fi

if [ -f go.mod ] && command -v go >/dev/null 2>&1; then
  go test ./...
fi

if [ -f Cargo.toml ] && command -v cargo >/dev/null 2>&1; then
  cargo fmt --check
  cargo test
fi

echo "==> Fast checks complete"

